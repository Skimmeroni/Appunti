#import "../AIModels_definitions.typ": *

A *Markov Decision Process* (*MDP*) is a search problem where transitions
are Markovian and where the environment is accessible but not deterministic.
That is, the agent has absolute certainty about the state of the environment
but the outcome of its actions is only partially predictable.

Formally, an MDP is a tuple $(cal(S), cal(A), s_(0), T, cal(R))$, where:

- $cal(S)$ is a discrete set of _states_;
- $cal(A)$ is the discrete set of _actions_ allowed in a certain state;
- $s_(0)$ is the state in which the environment is initialized;
- $cal(R) subset RR$ is the discrete set of _rewards_;

To avoid confusion, the following notation is used. A calligraphic symbol,
such as $cal(X)$, denotes an entire set. An uppercase letter, such as $X$,
denotes a generic member of the set of which $X$ belongs to. A lowercase
letter, such as $x$, denotes a specific element of the set of which $x$
belongs to.

The interactions between the agent and environment happen at discrete
time steps $t = 0, 1, 2, dots$ At each time step $t$, the agent receives
the state $S_(t) in cal(S)$ in which the environment is found, and based
on it chooses an action $A_(t) in cal(A)(s)$. In the following time step
$t + 1$, the agent finds itself in a new state $S_(t + 1)$ and receives
a reward $R_(t + 1) in cal(R)$.

This back and forth interaction between the agent and the environment
gives rise to a _sequence_ of states, actions and rewards:

$ S_(0), A_(0), R_(1), S_(1), A_(1), R_(2), S_(2), dots $

The $i$-th state, action or reward are different from sequence to
sequence, hence the capital letter. A specific sequence would have
this form:

$ s_(0), a_(0), r_(1), s_(1), a_(1), r_(2), s_(2), dots $

As a matter of fact, the $i$-th element of a generic sequence can be
conceived as a random variable, of which the $i$-th element of a specific
sequence is one of its possible realizations. This means that it's possible
to assign a probability of obtaining a specific outcome from the environment
(a reward and a state) at a certain time step $t$ based on the previous
states found and actions performed:

$ P(S_(t), R_(t) | S_(t - 1), A_(t - 1), S_(t - 2), A_(t - 2), dots, S_(0), A_(0)) $

In MDPs the Markov property ensures that the transitions of the environment
from one state to another depends only on the current state and the current
action. For this reason, the probability of obtaining a specific combination
of state $s'$ and reward $r$ only depends on the current state $s$ and the
current action $a$:

$ P(S_(t) = s', R_(t) = r | S_(t - 1) = s, A_(t - 1) = a) $

Which is just a function over all the possible states, rewards and actions,
that can be written as:

$ cal(P) : cal(S) times cal(R) times cal(S) times cal(A) mapsto [0, 1],
  cal(P)(s', r | s, a) = P(S_(t) = s', R_(t) = r | S_(t - 1) = s, A_(t - 1) = a) $

Since $cal(P)(s', r | s, a)$ always returns a value between $0$ and $1$, it
is a probability distribution as long as:

$ sum_(s' in cal(S)) sum_(r in cal(R)) cal(P)(s', r | s, a) = 1,
  forall s in S, a in cal(A)(s) $

The probability distribution $cal(P)(s', r | s, a)$ is also referred to as
the *dynamics* of the corresponding MDP. From this function one can extract
any possible information regarding the environment. One relevant example is
the *state-transition probability distribution*, denoted as $cal(T)$:

$ cal(T)(s' | s, a) =
  P(S_(t) = s' | S_(t - 1) = s, A_(t - 1) = a) =
  sum_(r in cal(R)) cal(P)(s', r | s, a) $

Which is the function that specifies the probability of reaching a certain
state $s'$ from the state $s$ employing the action $a$, without taking the
reward into account.

One can also compute the expected rewards for state–action pairs as
a two-argument function $cal(r): cal(S) times cal(A) mapsto RR$:

$ cal(r)(s, a) =
  E[R_(t) | S_(t - 1) = s, A_(t - 1) = a] =
  sum_(r in cal(R)) r sum_(s' in cal(S)) cal(P)(s', r | s, a) $

And the expected rewards for state–action–next-state triples as a
three-argument function $cal(r): cal(S) times cal(A) times cal(S)
mapsto RR$:

$ cal(r)(s, a, s') =
  E[R_(t) | S_(t - 1) = s, A_(t - 1) = a, S_(t) = s'] =
  sum_(r in cal(R)) r frac(cal(P)(s', r | s, a), cal(P)(s' | s, a)) $

The reward represents the feedback that the agent receives from the
environment in response of its actions. A positive reward means that
the agent performed a "fruitful" action, whereas a negative reward
means that the agent performed a "detrimental" action. The purpose
of the agent is then to perform actions in such a way that the total
obtained reward is as high as possible.

Note that this doesn't necessarely mean that the agent should always
choose actions that maximize _immediate_ reward; choosing a sub-optimal
action at time $t$ might allow the agent to perform an optimal action
at time $t + 1$ that was unreachable otherwise. What the agent should
do is maximizing the cumulative reward in the long run, thinking ahead.

Suppose that the sequence of rewards obtained by the agent from time
$t$ onward is $R_(t + 1), R_(t + 2), R_(t + 3)$. Since it's not possible
to know beforehand the realization of these random variables, the idea is
to try to maximize the *expected return* of the sequence. The *return* of
a sequence, denoted $cal(G)_(t)$, is defined as some specific function of
the reward sequence. The simplest choice is summing all rewards:

$ G_(t) = R_(t + 1) + R_(t + 2) + R_(t + 3) + dots $

Where the sequence might or might not be infinite.

However, a better approach is to introduce a *discount factor*
$gamma$, a real number between $0$ and $1$ that describes the
preference of an agent for current rewards over future rewards
or vice versa:

$ G_(t) =
  gamma^(0) R_(t + 1) + gamma^(1) R_(t + 2) + gamma^(2) R_(t + 3) + dots =
  sum_(i = 0)^(infinity) gamma^(i) R_(t + i + 1) $

When $gamma$ is close to $0$, rewards in the distant future are much less
valuable than closer ones, whereas when $gamma$ is close it $1$ it is the
other way around.

There are many justifications to introduce a discount factor. Most
importantly, it bounds the value of $G_(t)$ even in the presence of
an infinite sum. Suppose infact that the highest possible reward is
$R_("max")$. Then:

$ R_(t) lt.eq R_("max") =>
  sum_(i = 0)^(infinity) gamma^(i) R_(t + i + 1) lt.eq
  sum_(i = 0)^(infinity) gamma^(i) R_("max") =>
  sum_(i = 0)^(infinity) gamma^(i) R_(t + i + 1) lt.eq
  R_("max") (frac(1, 1 - gamma)) $

Since the right-hand side is a geometric series with common ratio $R_("max")$.

It is easy to see that returns obey a recursive law:

$ G_(t) =
  gamma^(0) R_(t + 1) + gamma^(1) R_(t + 2) + gamma^(2) R_(t + 3) + dots =
  R_(t + 1) + gamma (gamma^(0) R_((t + 1) + 1) + gamma^(1) R_((t + 1) + 2) + dots) =
  R_(t + 1) + gamma G_(t + 1) $

The way that an agent chooses which action to perform with respect to the
state it finds itself to be is called a *policy*. Formally, a policy is a
mapping from states to probabilities of selecting each possible action. If
the agent is following policy $pi$ at time $t$, then $pi(a | s)$ is the
probability that $A_(t) = a$ if $S_(t) = s$.

A policy is a prescription on how the agent should behave. Therefore, from
the policy's perspective, for the agent to be in one state can be better or
worse than being in another. This means that it's possible to assign a value
to a state that estimates how good it is, according to a certain policy, to
be in said state.

For a policy $pi$ and a state $s$, the *state-value function* $v_(pi)(s)$ is
defined as:

$ v_(pi)(s) =
  E_(pi)[G_(t) | S_(t) = s] =
  E_(pi)[sum_(i = 0)^(infinity) gamma^(i) R_(t + i + 1) | S_(t) = s] forall s in cal(S) $

That is, the expected return obtained starting at $s$ and following
$pi$ onwards.

Similarly, it is possible to define the *action-value function* $q_(pi)(s, a)$
as:

$ q_(pi)(s, a) =
  E_(pi)[G_(t) | S_(t) = s, A_(t) = a] =
  E_(pi)[sum_(i = 0)^(infinity) gamma^(i) R_(t + i + 1) | S_(t) = s, A_(t) = a] $

That is, the expected return obtained starting at $s$, taking action $a$ and
following $pi$ onwards.

The recursive equation for the rewards can be exploited to write a recursive
relation for the state-value function:

$ v_(pi)(s) &=
  E_(pi)[G_(t) | S_(t) = s] =
  E_(pi)[R_(t + 1) + gamma G_(t + 1) | S_(t) = s] = \
  &= sum_(a in cal(A)(s)) pi(a | s) sum_(s' in cal(S)) sum_(r in cal(R)) p(s', r | s, a)
  [r + gamma E_(pi) [G_(t + 1) | S_(t + 1) = s']] \
  &= sum_(a in cal(A)(s)) pi(a | s) sum_(s' in cal(S)) sum_(r in cal(R)) p(s', r | s, a)
  (r + gamma v_(pi)(s')) space forall s in cal(S) $

This equation is also known as the *Bellman equation* for $v_(pi)$. It
denotes a relationship between the value of a state and the values of
its successor states.

/*
An MDP is constituted by the following components:

- A discrete set of states $S$;
- A discrete set of actions $A(s)$, dependent on a state $s in S$;
- A starting state $s_(0) in S$;
- A transition model $P(s' | s, a)$, with $a in A(s)$ and $s, s' in S$.
  This is the probability of reaching state $s'$ while being in state
  $s$ and performing action $a$. Being Markovian, the probability of
  reaching $s'$ from $s$ depends only on $s$ and not on the history
  of earlier states;
- A reward function $R(s, a, s')$, with $a in A(s)$ and $s, s' in S$,
  that maps a real value to each transition. This value represents how
  advantageous it is for the agent to move from $s$ to $s'$ through $a$;
  Because the decision problem is sequential, the utility function will
  depend on a sequence of states and actions, an *environment history*,
  rather than on a single state. Rewards can be positive or negative,
  but are bounded by $plus.minus R_("max")$; In search problems, a cost
  function is to be minimized, and the same could be done for an MDP,
  however it is standard to employ a reward function to be maximized,
  even though minimizing the former or maximizing the latter is de facto
  the same. In the simplest case, rewards are additive.
- (Optional) a final state $s_(f) in S$.

In a deterministic search problem, a solution is simply a sequence of
actions (that minimizes the cost function), but in an MDP it would be
insufficient. This is because the environment is not deterministic,
and therefore performing a certain ordered sequence of actions does
not necessarely lead the agent to the expected state.

Therefore, a solution for an MDP must specify what the agent should do
for _any_ state that the agent might reach. A solution of this kind is
called a *policy*: policies are simply functions $pi: S mapsto A$ that
maps states to actions (denoting policies with $pi$ is customary).
Given a state $s in S$, the action $pi(s)$ is the one that the policy
$pi$ "suggests" the agent to perform if it were to find itself in $s$.

Out of all the policies, there is interest in finding the best one,
called *optimal policy*. Note however that executing the same ordered
sequence of actions from the same starting state, even if following
the same policy every time, does not necessarely lead to the same state.
Therefore, from trial to trial, the cumulative reward is not necessarely
the same.

To assess the quality of a policy it is then necessary to look at the
_expected_ cumulative reward. A policy that gives that maximizes the
expected cumulative reward is an *optimal policy*, denoted with $pi^(*)$.
A policy represents the agent function explicitly and is therefore a
description of a simple reflex agent, computed from the information
used for a utility-based agent.

An environment history is the ordered sequence $[s_(0), a_(0), s_(1),
a_(1), dots, s_(n)]$, meaning that the agent started in the state
$s_(0)$, performed action $a_(0)$, reached state $s_(1)$ (be it the
intended state or not), performed action $a_(1)$, ecc... until the
final state $s_(n)$ (be it the intended state or not) is reached.
It is generally understood that the pedix denotes a discretised time
instance, meaning that $s_(i)$ is the state reached at time $i$ and
$a_(i)$ is the action performed at time $i$, with $i in NN$.

A simplification that is useful to make is to assume that the policy
suggests actions only with respect to states, called *stationary policies*,
not with respect to both states and time, called *non-stationary policies*.
If a policy is non-stationary, it simply means that the cumulative reward
$U_(h)$, when a certain time $n$ is reached, stays the same indefinitely:

$ U_(h)([s_(0), a_(0), s_(1), a_(1), dots, s_(n)]) =
  U_(h)([s_(0), a_(0), s_(1), a_(1), dots, s_(n), a_(n), s_(n + 1), a_(n + 1), dots]) $

Meaning that there is interest in obtaining as much reward as possible
"before it's too late". On the other hand, with a stationary policy there
is no need to take time into account, because the reward only depends on
the state. This means that it's not limitative to consider environment
histories of infinite length.

Different policies can be compared by comparing the cumulative utilities
that would be obtained by executing them, with the goal of finding the
best one. Having chosen a certain policy $pi$, the utility of a certain
environment history is given by:

$ U_(h)([s_(0), pi(s_(0)), s_(1), pi(s_(1)), dots]) =
  gamma^(0) R(s_(0), pi(s_(0)), s_(1)) + gamma^(1) R(s_(1), pi(s_(1)), s_(2)) +
  dots = sum_(i = 0)^(+infinity) gamma^(i) R(s_(i), pi(s_(i)), s_(i + 1)) $

Where the actions in the history are chosen following $pi$. However, this
value is not really representative of the quality of the policy, because
there is no guarantee that employing the same policy will result in the
same environment history, and therefore in the same cumulative utility.
For this reason, it is necessary to work in term of averages.

Let $S_(i)$ denote a random variable representing the state that the
agent will reach at time $i$ when executing a certain policy $pi$ (the
state $S_(0)$ is the starting state). The probability distribution of
$S_(1), S_(2), dots$ depends both on the starting state, on the chosen
policy and on the transition model. Instead of having a fixed and
predetermined sequence, one has now a probabilistic sequence $[S_(0),
pi(S_(0)), S_(1), pi(S_(1)), dots]$.

The *expected additive cumulative reward* obtained by starting at $s =
S_(0)$ and following indefinitely the actions specified by $pi$ is given
by:

$ U^(pi)(s) = E[sum_(i = 0)^(+infinity) gamma^(i) R(S_(i), pi(S_(i)), S_(i + 1))] $

Where the expected value is with respect to the probability distribution
of the state sequences. Out of all the possible policies, the ones (or one)
of interest are those that maximise said expected value:

$ pi^(*)_(s) = limits("argmax")_(pi) (U^(pi)(s)) $

It can be proven that, if the policy is non-stationary and the reward
are discounted, then the optimal policy does not depend on which starting
state is chosen. The argument intuitively goes as follows: suppose that
$pi^(*)_(a)$ is an optimal policy with $a$ as starting state and, for the
same MDP, $pi^(*)_(b)$ is an optimal policy with $b$ as starting state.
Then, when both policies reach a third state $c$, since they are both
optimal, it can be assumed that they would suggest the same action for
this state, and an optimal policy $pi^(*)_(c)$ starting in $c$ would also
do the same. For this reason, the suffix $s$ in $pi^(*)_(s)$ can be dropped.

Therefore, the "true" utility of a state $s$ (how "worthy" it is for an
agent to find itself in $s$) is $U^(pi^(*))(s)$: the expected additive
cumulative reward obtained by starting in $s$ and indefinitely following
the actions suggested by any optimal policy. For simplicity, $U^(pi^(*))(s)$
is denoted as $V(s)$.

$ V(s) = U^(pi^(*))(s) = E[sum_(i = 0)^(+infinity) gamma^(i) R(S_(i), pi^(*)(S_(i)), S_(i + 1))] $

The utility function allows the agent to select actions by using the
*principle of maximum expected utility* (*MEU*); the best action is
the one that maximizes the sum between the reward obtained by reaching
a certain state and the true value of said state, weighted by the
probability of actually reaching it:

$ pi^(*)(s) = limits("argmax")_(a in A(s)) sum_(s') P(s' | s, a) [R(s, a, s') + gamma V(s')] $

The utility of a state $s$, $V(s)$, is defined with respect to the utility
of its neighbors. This relationship can be made explicit: the utility of a
state is the expected reward for the next transition plus the discounted
utility of the next state, assuming that the agent chooses the best action.
That is, the utility of a state is given by:

$ V(s) = limits("max")_(a in A(s)) sum_(s') P(s' | s, a) [R(s, a, s') + gamma V(s')] $

This equation, one for each state $s in S$ is referred to as the *Bellman
equation*. Another important quantity is the *action-utility function*, or
*Q-function* the expected utility of taking a given action in a given state:

$ V(s) = limits("max")_(a in A(s)) Q(s, a) $

The optimal policy can be extracted from the Q-function as follows:

$ pi^(*)_(s) = limits("argmax")_(a in A(s)) (Q(s, a)) $

It is also possible to rewrite the Bellman equation in terms of the Q-function
as follows:

$ Q(s, a) = sum_(s') P(s' | s, a) [R(s, a, s') + gamma limits("max")_(a in A(s')) Q(s', a')] $
*/
