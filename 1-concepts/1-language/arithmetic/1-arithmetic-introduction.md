- https://mywiki.wooledge.org/ArithmeticExpression?highlight=%28let%29 - let context and other contexts
- https://www.shell-tips.com/bash/math-arithmetic-calculation/#using-the-bc-command-line - source focused on Bash math
# How to create an arithmetic context
- The two most popular ways of creating an arithmetic context are `$((<expression>))` and `((<expression>))`
  - `$((<expression>))` is called "arithmetic expansion"
  - `((<expression>))` is called a "compound command used to evaluate arithmetic expansion" (confusing!)
    - The `let` keyword is an older form of this context
      - It's differnet because quotes are often needed
## Other ways that aren't discussed
- Using the legacy $ expr $ command (it's old, don't use it)
- Doing $ declare -i $ (it's confusing, don't do it)
- Doing arithmetic within an old test operator context (it's confusing, don't do it)
# Only integer arithmetic is natively supported
- Only integer arithmetic is natively supported. Floating-point arithmetic is not natively supported
- Use `bc` to do floating-point math or any amount of involved math
