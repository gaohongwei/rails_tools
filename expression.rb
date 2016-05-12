Regular Expression Basic
Anchor
  ^: line header
  $: line tailer
  \A: string header
  \z: string tailer (no new line)
  \Z: string tailer

Pattern:
  /./ - Any character except a newline.
  /./m - Any character (the m modifier enables multiline mode)
  /\d/: A digit character ([0-9])
  /\D/: 
  /\w/: A word character ([a-zA-Z0-9_])
  /\W/: non word char, [^a-zA-Z0-9]+
  /\s/: A whitespace character: /[ \t\r\n\f]/
  /\S/:
  /\h/: hex
  /\H/:

Repetition
*: >=0
+: >=1
?: 0/1
{n}: Exactly n times
{n,}: n or more times
{,m}: m or less times
{n,m}: At least n and at most m times

1. %r{... } : (/... /)
  expect(rendered).to match %r{<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>}
