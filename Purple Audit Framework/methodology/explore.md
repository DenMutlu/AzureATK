# Phase 3 — Explore

Study gives context. Exploration builds operational confidence.

This phase is where theory becomes practice. The goal is to learn the tools, understand their behavior, and identify what can be used safely in production.

## Objectives

- test and understand the tooling
- validate technical assumptions
- measure generated logs and operational noise
- identify permissions required
- distinguish lab-only confidence from production readiness
- prepare controlled production-safe validation steps

## Why exploration matters

A methodology built only from documentation is incomplete.

In practice, you need to understand:

- what a tool actually does
- what permissions it requires
- what output is useful
- what output is noisy
- what logs it generates
- what alerts it may trigger
- what can be safely repeated in production

## The lab is still necessary

The lab helps you:

- learn the tools safely
- understand attack and control logic
- practice repeatable steps
- fail without consequences
- build confidence before moving into production

But lab success does not automatically mean production readiness.

## What the lab does not show well

Labs often hide real-world conditions, such as:

- operational noise
- legacy exceptions
- incomplete logging
- unclear ownership
- process and approval friction
- business continuity constraints
- cross-team dependencies

This is why production-safe validation must be designed, not improvised.

## What to validate during exploration

Before using any technique in a real audit, answer these questions:

1. What does this action actually do?
2. What permissions are required?
3. What logs does it produce?
4. What alerts might it trigger?
5. What business impact could it have?
6. Can it be safely reduced in scope?
7. Can it be reproduced with a test identity?

## Recommended progression

Use a controlled sequence:

1. learn in lab
2. reduce scope
3. use test identities and minimal permissions
4. measure logs and impact
5. validate only what is safe in production

## Examples of good exploration outcomes

- confirming how device code authentication appears in sign-in logs
- observing what a PIM activation generates in audit data
- mapping what an app permission review can reveal without modifying anything
- understanding what a community tool collects and how noisy it is
- identifying whether a workflow is safe for a customer tenant

## Output of the exploration phase

At the end of this phase, you should have:

- a short list of trusted tools
- safer validation steps
- known logging and visibility expectations
- known operational risks
- a reduced-scope approach ready for production use

## Practical notes

- explore for controlled use, not curiosity alone
- prefer clarity and safety over flashy demonstrations
- record what works, what is noisy, and what should be avoided
- document cleanup steps when relevant

## Transition to the next phase

Once the tooling and techniques are understood, turn that experience into a reusable audit framework.
