def upper_solver(U,b):
    '''Solves Ux=b for unknown vector x.

    Parameters
    ----------
    U : Upper Triangular Matrix of size (nxn).
        A square matrix with all zero elements below the main diagonal.
    b : Vector.
        Vector of size n. Right hand side of system of linear equation.
   
    Returns
    -------
    x  : vector.
        Implements back-substitution to solve Ux=b.

    Examples
    --------
    >>> f = lambda x: x**2 - x - 1
    >>> Df = lambda x: 2*x - 1
    >>> newton(f,Df,1,1e-8,10)
    Found solution after 5 iterations.
    1.618033988749989
    '''

    x = 

    xn = x0
    for n in range(0,max_iter):
        fxn = f(xn)
        if abs(fxn) < epsilon:
            print('Found solution after',n,'iterations.')
            return xn
        Dfxn = Df(xn)
        if Dfxn == 0:
            print('Zero derivative. No solution found.')
            return None
        xn = xn - fxn/Dfxn
    print('Exceeded maximum iterations. No solution found.')
    return None