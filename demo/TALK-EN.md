
(Slide 1)

Hello everyone, and thank you for coming today.
In this session, we’re going to talk about a rather special topic: when building a developer platform, we usually think about availability, scalability, UX… but rarely about testability.
So today, we’ll talk about platforms, of course, but most importantly, we’ll see how to apply Test-Driven Development to Platform Engineering.

Here’s what to expect during this session:

(Slide 2)

First, we’ll build a platform without any tests. We’ll run it, and — unsurprisingly — something is going to go wrong.

Second, we’ll introduce Test-Driven Development. We’ll start from scratch to rebuild the same platform, this time writing tests before the code, to ensure that the platform contracts remain valid with every change.

And third, we’ll see how these tests can be executed automatically — both locally by a platform engineer during development, and by the developer teams consuming the platform, to validate their integrations.

(Slide 3)

Before diving into the main content, let’s start with introductions.

I’ll give the floor first to Sara, who will introduce herself.

(Sara introduces herself)
(I introduce myself)

Now that introductions are done…

Sara, our favorite platform engineer, can you present the need and the platform we’ll be building today?

(Slide 4)

(Slide 5)

Thanks!

For this session, we’ll start with a simple — yet realistic — requirement:

👉 Goal: Run a Drupal application.

To do this, we have two teams:

A Platform team, managing databases, CI/CD, infrastructure, shared services…

A Dev team, managing the Drupal application itself and consuming the services provided by the platform team.

On the surface, everything seems clear, each team knows its role…

What could possibly go wrong, right? 😄

(Slide 6)

To build our platform, we’ll rely on a modern technical stack, representative of what many teams use today:

Kubernetes, to orchestrate our workloads.

ArgoCD, for GitOps deployment and environment synchronization.

Crossplane, for on-demand infrastructure provisioning directly from Kubernetes.

Nothing exotic — just the tools we all love… and which can still surprise us when we don’t have tests. 😅

(Slide 7)

Alright, now that the need is defined and the stack is clear, it’s time to take action.

To really understand the importance of Test-Driven Development, we’ll start by building our platform without any tests.

Yes, you heard that right: we’ll deploy and use the platform as-is, to see what happens when nothing is automatically verified.

And as you can imagine… the inevitable will happen. 😅

So, sit back, relax, and let’s see what can go wrong when we ignore testability from the start.

(Slide 8)

Le schéma du design.

(Slide 9)

Time for a demo.

(Slide 10)

Well… that’s exactly the kind of situation we wanted to show. 😅

When building a platform without tests, errors will inevitably occur — and they can have unexpected consequences.

But there is a way to reduce this stress and maintain confidence in our changes: Test-Driven Development.

In the next part of this session, we’ll see how to rebuild the same platform using TDD from the start, so that the contracts between the platform team and developer teams remain valid, and such incidents are much less likely to happen.

(Slide 11)

Alright, now that we’ve seen what can go wrong when nothing is tested, let’s start over from scratch.

This time, we’ll take a Test-Driven approach:

We’ll start by writing the tests first.

Then we’ll build the platform services, making sure each feature passes the tests.

We’ll make changes and evolve the platform as we go, confident that the tests guarantee correct behavior.

And most importantly, we’ll only deploy when all tests pass.

The goal is simple: to show how TDD can give us confidence in our changes and drastically reduce incidents in a real platform.

(Slide 12)

Before we dive into writing our tests, I want to introduce a tool that will make this process much simpler: Kyverno Chainsaw.

Kyverno Chainsaw allows us to define our platform tests declaratively, as policies and rules, rather than writing them imperatively. This means we can describe what “correct behavior” looks like, and let the tool automatically check that our resources, configurations, and workflows comply.

Using Chainsaw, we can ensure that every change to our platform is validated against these rules, giving both platform engineers and developers confidence that their work won’t break critical contracts.

In short: it’s a declarative safety net for platform testing — simple to write, easy to maintain, and automatically enforceable.

Great, now let’s move into demo mode.

We’re going to rebuild our platform from scratch — but this time, following Test-Driven Development strictly.

