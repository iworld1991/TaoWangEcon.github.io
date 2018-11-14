
### Costly State Verification
 
- Tao Wang
- Nov 2018

### What is this model about?

- Under asymmetric information, lender requires a higher-than-safe-return premium. The preminum increases with agency cost, safe rate and decreases with expected return of the project and net-wealth of the entrepreneur. These highlight the financial imperfection that lead to credit rationning and under-financing of the investment project.   
- It explains why lower safe rate, more symmetric information, more cash-holding and more profitable project could ease lending conditions. 

### Model

The entrepreneur $E$

- has wealth $W < 1$; 
- decides if to make investment of value 1;
- thus needs to borrow $1-W$;
- the return of project $\gamma$ is randomly drawn from a uniform distribution over $[0,2\bar\gamma]$;


The outsider lender $L$

- has more than $1-W$ and decides if to finance the project;
- if any, he is the only investor;
- risk neutral, thus only cares about the expected return;

Instead of investing on the project, there is a safe return of the economy $r$.

Both agents make the choice if their expected return of doing so exceed the safe return.

- $\text{Expected Return of Entrepreneur}\geq W(1+r)$
- $\text{Expected Return of Lender} \geq (1-W)(1+r)$

Some necessary assumptions for the problem to be interesting.

- Investing on the project is socially desirable. $\bar \gamma > (1+r)$;
- Lenders are competitive. So the expected return from the lending is equal to safe return. 
 * Expected Return of Lender $= (1-W)(1+r)$

Under **symmetric information**, namely when the state of the world, i.e. the output level is perfectly observed, the equilibrium is simple.
- Lenders finance the project if $\text{Expected Return of Lender} = (1-W)(1+r)$
- Entrepreneur undertakes the project by borrowing $1-W$ and pays $(1-W)/\gamma$ fraction of the realized output. This gives $\text{Expected Return of Lender} = (1-W)(1+r)$.

Under **asymmetric information**, one need to have a more complicated contract so that the project is financed. Let us assume the information asymmetry takes the form of unobservability of output. It may take a variety of forms in this class of the model, but the insights from all of them are similar. 

The output is not directly observable but verifiable at a fixed cost $C$. Now, expected return is the expected payment minus expected verification cost. 

$$\text{Expected Return of Lender} = \text{Expected Payment}- \text{Expected Verification Cost}$$

What does the contract look like in this case? 

The incentive problem is that the entrepreneur likes to report lower level of output to pay less. This lowers the expected payment to the lender. In response to this problem, the lender needs to invoke the verification in certain scenarios. Once invoked, lender will take all the return from entrepreneur $\gamma$. 

- Without verification, payment cannot depend upon the realized output. So it has to be a constant. Call it $D$.  

- With verification, payment is equal to $\gamma$, the realized output. 

The payment as a function of output $\gamma$ is 45 degree line up till $\gamma =D$ and turns flat afterward. 

This is a typical **debt contract**. 

Let us think how the level of **$D$ affect the expected return** of the lender. 

1. $D$ is extremely high.

 * When $D > 2\bar \gamma$, the lender obtains a fixed return $\bar\gamma - C$ if it is financed. (As we will discuss later, actually, entrepreneur, knowing this, will not undertake the investment in the first place.)
 
2. When $D$ is not that high so that the project is financed, there are two competing forces resulting from higher $D$. On one hand, higher $D$ increases the payment when output is high enough to pay back the debt; but on the other hand, it increases the probability of non-payment and it becomes more likely for the lender to invoke the verification to collect the payment $\gamma$ by paying $C$. 

 * $0< D < 2\bar \gamma$, expected return decreases with $D$ as the second force dominates; 
 
 * $0< D << 2 \bar \gamma$, at a lower end, expected return increses with $D$ as the first force dominates; 

Somewhere in between is the $D^{Max}$ that maximizes expected return of the lender. 

$$\text{Expected Return of the Lender} = \underbrace{ \frac{D}{2\bar\gamma}}_{P(\gamma < D)} (\underbrace{\frac{D}{2}}_{E(\gamma|\gamma<D)} - C ) + \underbrace{\frac{2\bar \gamma-D}{2\bar \gamma}}_{P(\gamma>D)}D$$ 

$$D^{Max} = 2\bar\gamma-C$$

$$R^{Max} = (\frac{2\bar \gamma-C}{2\bar\gamma})^2\bar \gamma$$


**Participation constraint of lender** requires $$(1-W)(1+r) < R^{Max}$$. To see this clearly, we need to consider three cases. 
1. $(1-W)(1+r) > R^{Max}$, ** Credit Rationning**. No interest rate $D$ can satisfy the lender. She is not willing to lend money anyway.
2. $\bar \gamma-C <(1-W)(1+r) < R^{Max}$. As $\text{Expected Return of Lender}= \gamma - C$ when $D = 2\bar\gamma$. So $R^{Max} > \gamma-C$. There are two levels of $D^*$ that solves the equation $(1-W)(1+r) = \text{Expected Return of Lender}$. But competition among lenders eliminate the higher $D$ equilibrium. 
3. $(1-W)(1+r)<\bar \gamma$. Unique solution of $D$. 

In both 2.and 3., the equilibrium $D^*$ is the smaller root of the following equation. 

$$\text{Expected Return of the Lender} = (1-W)(1+r)$$

This is the interest rate payment that makes the lender willing to lend. 



**Participation constraint of the entrepreneur** requires 

$$W(1+r)<\underbrace{\bar \gamma}_{\text{Expected Return of the Project}} - \text{Required Return of Lender}$$


$$\text{Required Return of Lender} = (1-W)(1+r) + \text{Expected Verification Cost}$$


$$\text{Expected Verification Cost}= \underbrace{\frac{D^*}{2\bar\gamma}}_{P(\gamma < D^*)} C$$ 

Expected verification cost is a function of $C$,$r$,$W$ and $\bar \gamma$. 

Denote it as $A(C,r,W,\bar\gamma)$.

We have following relationship

- A increases with C, higher cost of verification makes verification more costly;
- A increases with r, higher safe rate also increaes verification more costly;
- A decreases with W, lower self-wealth by entrepreneur makes it verification more costly; 
- A decreases with $\bar \gamma$, lower expected output of the project makes it more costly;  

Higher $A$ means the required return by lender higher and the participation constraint for the entrepreneur harder to satisfy. 

To summarize, the entrepreneur will undertake the project only if 

$$\bar \gamma - (1-W)(1+r)- A(C,r,W,\bar \gamma) > W(1+r)$$

To rewrite this in the following format gives the essence of these kinds of problem. 

$$\underbrace{\bar \gamma - \underbrace{((1-W)(1+r)+W(1+r))}_{\text{Total Safe Return}}}_{\text{Total Surplus of the Project}}> A(C,r,W,\bar \gamma) $$

It basically says that the total surplus from investing in the project should be greater than the cost involved. These are the participation constraints.

Typically, for these kind of questions, either one constraint of lender or the entrepreneur is binding. No matter which case arises, the key insight is that agency costs from information asymmetry leads to credit rationning and underfinancing of the project. 
