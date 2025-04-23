#import "../AIModels_definitions.typ": *

An *intelligent agent*, or simply *agent*, is any entity that is
capable of *perceiving* the *environment* in which it finds itself
through *sensors* and *influencing* said environment through *actions*.
The environment is the section of the universe available for the agent
to be perceived and acted upon.

The sequence of perceptions of an agent is the complete history of
anything it has perceived. In general, what action an agent performs
depends from its prior knowledge and/or from its previous perceptions.
Formally, an agent's behaviour is described by a function $"Pow"(P)
mapsto A$ that maps sequences of perceptions to actions.

An agent is said to be *rational* if it picks the best choice of actions.
The notion of "best choice" commonly adopted in the field artificial
intelligence is *consequentialism*: the agent's behavior is evaluated on
the basis of the consequences of its actions. If an agent, in relation to
a certain perception, performs an action that is deemed desirable for the
user, then that agent has made the "best choice", and is then rational.

The notion of desirability is described by a *performance measure* that
evaluates each sequence of states in which the environment is found. This
measure allows an operational definition of a rational agent: for each
possible sequence of perceptions, a rational agent will choose to perform
the action that, based on previous perceptions and on its prior knowledge,
maximises the performance measure.

Note how "rational" does not necessarely mean "omniscient", that is, able
to know in advance the consequences of its actions. Indeed, an agent might
not even know the entirety of the environment, or might have unreliable
perceptions that might not match the environment analyzed. For these reasons,
a rational agent should limit himself to performing actions that maximize
_expected_ performance.

The hereby given definition of rational agent, especially since the
environment might be partially or totally unknown to it, does not
exclude the possibility for it to *learn*: its initial configuration
might be set, but it can be modified and improved with experience. In
the case where the environment is entirely known a priori, the agent
is said to be *autonomous*, since it needs no learning and merely
performs the preset actions.

It is useful to classify the environments with respect to five informal
metrics, in order to better approach the construction of agents:

- *Accessible* or *inaccessible*. The accessibility of an environment is
  a measure of how much information an agent is able to extract from it.
  An environment can be inaccessible due to limitations of the agent or
  be inherently so. Environments in the real world are always, have
  necessarily to some degree, inaccessible.
- *Deterministic* or *non-deterministic*. An environment is deterministic
  if the actions of the agent influence it in a predictable manner, that
  is if the result of the agent's actions always match the expected outcome.
  The physical world to be model always has some degree of nondeterminism.
- *Episodic* or *sequential*. In an episodic environment, an agent's
  experience can be divided into atomic steps where the choice of an
  action depends solely on current perception. In a sequential environment,
  the actions an agent takes may depend wholly or in part on which actions
  have been taken previously.
- *Static* or *dynamic*. An environment is static if it is affected only
  and exclusively by the agent's actions. If it can also change beyond the
  capabilities of the agent, then it is dynamic.
- *Discrete* or *continuous*. An environment is discrete if the number
  of states in which it can be is finite, that is, if it is possible (at
  least theoretically) to enumerate all its possible states, otherwise
  it is continuous. Since computers are discrete by definition, modeling
  a continuous environment through an automatic system will always require
  some degree of approximation.

#exercise[
  Suppose that the environment is the game of chess, the agent is
  the player (a human or a computer) and the actions are the possible
  moves. How would the environment be? 
]
#solution[
  - Accessible, because the agent has complete knowledge on the
    game state (the pieces on the board, their positions, ecc...)
  - Deterministic, because a piece moved will always land on the
    predetermined square 
  - Sequential, because the allowed set of moves depends on the
    previous moves
  - Static, because the state of the board can only change in
    response to a player's move
  - Discrete, because the possible number of states is finite
    (albeit very large)
]

It is also possible to informally classify agents themselves,
in four categories in order of complexity.

=== Simple-reflex agents

The simplest agents to construct are the *simple-reflex agents*.
These agents have no model of the environment: the chosen action
depends solely on the current perception and have no cognizance
of previous perceptions.

Agents of this kind pick their action following *condition-action rules*:
_if_ a certain condition is met, _then_ the action associated to that
condition is performed.

A schematic representation of a simple-reflex agent is presented below.
The function `INTERPRET-INPUT` generates an abstract description of the
perception received by the agent, while the function `RULE-MATCH` returns
the first action associated to that perception representation in the rule
set `rules`.

#algorithm[
  ```
  rules <= set of condition-action rules

  function SIMPLE-REFLEX-AGENT(percept)
    state <= INTERPRETER-INPUT(percept)
    rule <= RULE-MATCH(state, rules)
    action <= rule.action
    return action
  ```
]

Simple-reflex agents have limited intelligence. Indeed, agents
of this kind operate on the predicament that the optimal action
to be taken can be deduced entirely from its perceptions, i.e.
if the environment is fully accessible. If this isn't the case
or if the agent's a priori knowledge is faulty, the agent is
bound to operate in a irrational manner.

An even more problematic situation that can arise with simple-reflex
agents is infinite loops, since these agents are unable to detect them.
The issue can only be ameliorated by introducing a degree of randomness
on the chosen actions, so that the chance of applying the same action
more than once in a row is reduced.

=== Reflex-based, model-based agents

The most efficient way to tackle the problem of having to deal with
a partially accessible environment is to keep track of the section
of the environment of which the agent has no knowledge. That is, the
agent should be equipped with an *internal state* that depends on the
perceptions it has previously picked up, so that it stores knowledge
both about the current state and about other states. Agents of this
kind are called *reflex-based, model-based agents*.

Periodically updating such an internal state requires the agent
to know how the environment evolves over time, both in terms of
how the agent's actions affect the environment and in terms of
how the environment evolves on its own. This body of information
goes by the name of *transition model*. In addition, it is necessary 
to have information regarding how the evolution of the environment
is reflected on the agent's perceptions, collectively called
*sensory model*.

A schematic representation of an agent with reflexes but based on a
model is presented below, where the function `UPDATE-STATE` updates
the agent's internal state before returning the action to be taken.

It should be noted how a reflex-based, model-based agent can hardly
determine with certainty the state of the environment, and most likely
has to rely on approximate descriptions.

#algorithm[
  ```
  state            <= the agent's current conception of the environment state
  transition_model <= a description on how the next state depends on
                      the current state and action
  sensor_model     <= a description on how the current world state is
                      reflected in the agent's percepts
  rules            <= set of condition-action rules
  action           <= the most recent action (starts NULL)

  function MODEL-BASED-REFLEX-AGENT(percept)
    state <= UPDATE-STATE(state, action, percept, transition_model, sensor_model)
    rule <= RULE-MATCH(state, rules)
    action <= rule.action
    return action
  ```
]

=== Model-based, objective-based agents

There are situations in which the best action to be chosen also depends
on some kind of long-term goal. This goal might not be reachable in the
span of a single action, but could instead require many intermediate steps.
In agents of this kind, the same action and the same internal state may
result in different actions if the goal is different. Such agents are
called *model-based, objective-based agents*.

=== Model-based, utility-guided agents

It is not always possible to construct a rational agent simply by 
pushing it to achieve a goal. Indeed, if that goal can be achieved
through different sequences of actions, one might be preferable to
another. Moreover, an agent might have to pursue several simultaneously
incompatible goals, i.e., perform actions that "bring it closer" to one
goal but at the same time "push it away" from another.

Instead of thinking about states exclusively in terms of "favorable"
and "unfavorable", a more nuanced approach involves introducing a
measure of *utility*, which influences the agent's choice in choosing
which action to take (together with the performance measure, the goal
to be followed, and from one's own internal state).

The utility measure allows the agent to, in having to pursue several
mutually incompatible goals, choose the action that gives the best
tradeoff in advancing all of them. In addition, the structure of the
environment does not always guarantee that a goal can be achieved with
absolute certainty simply by performing the appropriate actions; even
in this case, the utility measure allows one to assess how "convenient"
it is for the agent to perform a certain action weighting the probability
of actually achieving a goal if said action is undertaken.

=== Learning agents

The most interesting agents are undoubtedly those capable of *learning*;
all agents presented so far can be constructed as learning agents. The
considerable advantage is that they can operate in a completely unknown
environment with little to no prior knowledge and learn from it, so that
they can perform the best actions even in situations where even the designer
cannot predict what this best action would be.

An agent capable of learning can be conceptually broken down into four
components:

- The *learning component*, which is concerned with improving the
  agent's performance;
- The *performance component*, which chooses which action to take
  based on perceptions and of the internal knowledge state (this
  component constituted the entire agent in previous models);
- The *critic*, which informs the learning component of what the
  agent is behaving optimally (rationally) based on a predetermined
  performance standard. This component is necessary because perceptions,
  by themselves, are not able to inform the agent about the optimality
  of its behavior;
- The *problem generator*, which suggests actions to the agent that may
  result in new and informative experiences. This component is necessary
  because if the agent relied exclusively on the performance component,
  it would always choose the best actions on the basis of his _current_
  knowledge, which is not necessarily complete. The problem generator can
  induce the agent to take actions that can be suboptimal in the short run
  but that can lead to even better outcomes in the long run.
