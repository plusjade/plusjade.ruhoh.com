---
title: Numerical Differentiation
---

## Derivative of a real function

The derivative of $f(x)$ is
\begin{equation}
f'(x) = \lim_{h \rightarrow 0} \frac{f(x + h) - f(x)}{h} \label{eq:DerivativeDef}
\end{equation}

suggest a naive approach to compute a numerical derivative: pick a small value $h$ and apply \eqref{eq:DerivativeDef}. However, applied uncritically, this procedure is almost guaranteed to produce inaccurate results.

[Ridders](#Ridders) applied Romberg's method to improve the accuracy in the computation of the first and second derivatives of a real function. Using the Taylor expansion in the vicinity of $x$:
$$
f'(x) \approx \frac{f(x + h) - f(x - h)}{2h}
$$
with a truncation error of $e_t \sim h^2 f^{(3)}$. As a consequence, $e_t$ decreases quadratically with decreasing $h$. When we repeatedly halve the value of $h$ a series of corresponding values of 
$\frac{f(x + h) - f(x - h)}{2h}$ is obtained, which we denote by <script type="math/tex">A_1, A_2, A_3, \ldots</script>

Now <script type="math/tex">f'(x) \sim A_1 + e_{t_1} \sim A_2 + e_{t_2}</script>, furthermore <script type="math/tex">e_{t_1}/e_{t_2} = 4</script>, so we get a better approximation:
<script type="math/tex; mode=display">
\begin{equation}
f'(x) \approx \frac{4A_2 - A_1}{4 - 1}
\end{equation}
</script>

which we denote by $B_1$.

This procedure leads us to the well known Romberg method:

<table width="30%">
	<tbody>
		<tr>
			<td>       </td>  <td>$A_1$</td>  <td>$A_2$</td>  <td>$A_3$</td>  <td>$A_4$</td>  <td>...</td>
		</tr>
		<tr>
			<td>$m = 1$</td>  <td>     </td>  <td>$B_1$</td>  <td>$B_2$</td>  <td>$B_3$</td>  <td>...</td>
		</tr>
		<tr>
			<td>$m = 2$</td>  <td>     </td>  <td>     </td>  <td>$C_1$</td>  <td>$C_2$</td>  <td>...</td> 
		</tr>
		<tr>
			<td>$m = 3$</td>  <td>     </td>  <td>     </td>  <td>     </td>  <td>$D_1$</td>  <td>...</td>
		</tr>
	</tbody>
</table>

with
<script type="math/tex; mode=display">
\begin{gather}
B_n = \frac{A_{n + 1}\cdot 4^m - A_n}{4^m - 1},\quad m = 1 \newline
C_n = \frac{B_{n + 1}\cdot 4^m - B_n}{4^m - 1},\quad m = 2
\end{gather}
</script>
and so on.
 
Next you'll find Ridders' method implemented for the JVM (using Scala + scalala). See [Press](#Press) for a C++ implementation.
    
    package mx.umich.fie.dep.evolcomp.stability

    import scalala.tensor.dense.DenseMatrix
    import scalala.tensor.dense.DenseVector
    import scalala.library.Plotting._
    import scala.math._
    import scala.util.control.Breaks._ 

    object ScalalaTest {

      def main(args: Array[String]): Unit = {
	val (der1, error1) = difRidders(x => x * x, 1.0, 2.0)
	println("d(x^2)/dx at x = 1 is: " + der1)
	println("With estimated error of: " + error1)

	val (der2, error2) = difRidders(x => 3*pow(x, 7), 5.0, 1.0)
	println("\nd(3x^7)/dx at x = 5 is: " + der2)
	println("With estimated error of: " + error2)
      }

      def difRidders(fn: Double => Double, x: Double, h: Double): (Double, Double) = {
	if (h == 0)
	  throw new RuntimeException("h must be nonzero in difRidders")

	val ntab = 10
	val safe = 2.0
	var errt, fac, hh, ans: Double = 0.0
	val a = DenseMatrix.zeros[Double](ntab, ntab)
	hh = h;
	a(0,0) = (fn(x + hh) - fn(x - hh))/(2.0 * hh)
	var err = Double.MaxValue
	val con = 1.4
	var con2 = con * con

	breakable {
	  for (j <- 1 until a.numCols) {
	    hh /= con
	    a(0, j) = (fn(x + hh) - fn(x - hh))/(2 * hh)
	    fac = con2
	    for (i <- 1 to j) {
	      a(i,j) = (a(i - 1, j)*fac - a(i - 1, j - 1))/(fac - 1.0)
	      fac = con * fac
	      errt = max(abs(a(i, j) - a(i - 1, j)), abs(a(i, j) - a(i - 1, j - 1)))
	      if (errt <= err) {
		err = errt
		ans = a(i, j)
	      }
	    }
	    val higherOrderWorse = abs(a(j, j) - a(j - 1, j - 1)) >= safe*err
	    if (higherOrderWorse) {
	      break
	    }
	  }
	}
	return (ans, err)
      }
    }

The output is:

    d(x^2)/dx at x = 1 is: 2.000000000000001
    With estimated error of: 8.881784197001252E-16

    d(3x^7)/dx at x = 5 is: 328125.00000000856
    With estimated error of: 4.94765117764473E-9

as expected.

## Jacobian of a function of several variables

Next algorithm is based on [Dennis](#Dennis).

**Purpose**: Calculate a forward difference approximation to <script type="math/tex">J(\mathbf{x}_c)</script> (the Jacobian matrix of $\mathbf{F}(\mathbf{x})$ at $\mathbf{x}_c$) using values of $\mathbf{F}(\mathbf{x})$.  
**Input Parameters**: $n \in \mathbb{Z}$, <script type="math/tex">\mathbf{x}_c \in \mathbb{R}^n</script> , <script type="math/tex">\mathbf{F}_c \in \mathbb{R}^n ( = \mathbf{F}(\mathbf{x}_c))</script>,
 FVEC (the name of $\mathbf{F} \colon \mathbb{R}^n \to \mathbb{R}^n$), <script type="math/tex">\mathbf{S_x} \in \mathbb{R}^n</script>, $\eta \in \mathbb{R}$.    
**Input-Output Parameters** : none  
**OutputParameters**: <script type="math/tex">J \in \mathbb{R}^{n \times n} \approx J(x_c)</script>

**Description**:  
Column $j$ of <script type="math/tex">J(\mathbf{x}_c)</script> is approximated by <script type="math/tex">(F(\mathbf{x}_c + h_j \mathbf{e}_j) - F(\mathbf{x}_c))/h_j</script>, where
 <script type="math/tex">\mathbf{e}_j</script> is the $j$-th unit vector, and <script type="math/tex">h_j = \eta^{1/2} max \{ |x_c[j]|, 1/ \mathbf{S_x} [j] \} \text{sign}(\mathbf{x}_c [j])</script>. Here
<script type="math/tex">\mathbf{S_x} [j]</script> is the typical size of <script>|\mathbf{x}_c [j]|</script> input by the user, and $\eta = 10^{-\text{DIGITS}}$ the number of reliable base 10 digits in $\mathbf{F(x)}$. The corresponding elements of $J(\mathbf{x}_c)$ and $J$ typically will agree in about their first $(\text{DIGITS}/2)$ base 10 digits.

1. $\text{sqrteta} \leftarrow \eta^{1/2}$
2. FOR $j = 1$ to $n$ DO  
    *calculate column $j$ of $J$*  
    2.1 <script type="math/tex"> \text{stepsizej} \leftarrow \text{sqrteta} \cdot \max \{ |\mathbf{x}_c [j]|, 1/ \mathbf{S_x} [j] \} \cdot \text{sign}(\mathbf{x}_c [j])</script>  
    *to incorporate a different stepsize rule, change line 2.1*  
    2.2 <script type="math/tex"> \text{tempj} \leftarrow \mathbf{x}_c [j]</script>  
    2.3 <script type="math/tex"> \mathbf{x}_c [j] \leftarrow \mathbf{x}_c [j] + \text{stepsizej}</script>  
    2.4 <script type="math/tex"> \text{stepsizej} \leftarrow \mathbf{x}_c [j] - \text{tempj}</script>  
    2.5 CALL <script type="math/tex">\text{FVEC}(n, \mathbf{x}_c , \mathbf{F}_j)</script>  
    2.6 FOR $i = 1$ TO $n$ DO  
        <script type="math/tex">\qquad J[i,j] \leftarrow (\mathbf{F}_j [i] - \mathbf{F}_c [i]) / \text{stepsizej}</script>  
    2.7 <script type="math/tex"> \mathbf{x}_c [j] \leftarrow \text{tempj}</script>  


## References

1. <a id="Ridders">Ridders</a>, C.J.F. 1982, “Accurate computing of $F'(x)$, $F^{\prime \prime}(x)$,” Advances in Engineering Software, vol. 4, no. 2, pp. 75–76.  
2. <a id="Press">Press</a>, William H., Saul A. Teukolsky, William T. Vetterling, and Brian P. Flannery. Numerical Recipes 3rd Edition: The Art of Scientific Computing. 3rd ed. Cambridge University Press, 2007.  
3. <a id="Dennis">Dennis</a>, J. E., and Robert B. Schnabel. Numerical Methods for Unconstrained Optimization and Nonlinear Equations. Society for Industrial Mathematics, 1987.


