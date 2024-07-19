---
title: Regex
---

Regex pattern matching is supported in most modern programming languages, however they each might have their own regex engine implementing a custom 'flavour' of regex.

> Use [this regex engine comparison table](https://gist.github.com/CMCDragonkai/6c933f4a7d713ef712145c5eb94a1816) to check if the syntax you're trying to use is supported.

> Use [regex101](https://regex101.com/) to sanity check the correctness of your regex pattern.

| Metacharacter  | Description                                                                             |
| -------------- | --------------------------------------------------------------------------------------- |
| `.`            | Any character.                                                                          |
| `*`            | 0 or more times.                                                                        |
| `?`            | 0 or 1 time.                                                                            |
| `+`            | 1 or more times.                                                                        |
| `^`            | Match from the start of the string.                                                     |
| `$`            | Match up to the end of the string.                                                     |
| `{n,m}`        | `n` (inclusive) to `m` (inclusive) times.                                               |
| `[a-zA-Z0-9]`  | Alphanumeric characters, lowercase and uppercase.                                       |
| `[^a-zA-Z0-9]` | Anything *apart from* alphanumeric characters.                                          |
| hello\|world   | Matches `hello` or `world`.                                                             |
| hell(o\|w)orld | Matches `helloorld` or `hellworld`. We use parentheses for grouping among other things. |

| Character Class | Description                                                  |
| --------------- | ------------------------------------------------------------ |
| `\w`            | Any word, which is basically a shorthand for `[a-zA-Z_0-9]`. |
| `\W`            | Anything *not* a word.                                       |
| `\d`            | Any digit, which is basically a shorthand for `[0-9]`. |
| `\D`            | Anything *not* a digit.                                       |
| `\s`            | Any whitespace character (space, tabs, newlines, etc.)       |
| `\S`            | Anything *not* a whitespace.                                 |

## Non-Greedy Matching
Regex matching is typically *greedy*, meaning that `(Ha){3,5}` will match the longest string possible, which would be `HaHaHaHaHa` if that exists. Using `(Ha){3,5}?` will perform non-greedy matching, preferring to match `HaHaHa`.

You can use non-greedy matching by appending a `?` qualifier. For example, `.*?` matches 0 or more of any character non-greedily.

### Example
Suppose we want to interpolate values into the string: `"Hi {{world_type}}. I am {{name}}."`. We'd might use the regex: `{{(.*)}}` and extract out the capture group. Since greedy matching is the default, this would extract the capture group: `world_type}}. I am {{name`. To fix this, use the regex `{{(.*?)}}`.
