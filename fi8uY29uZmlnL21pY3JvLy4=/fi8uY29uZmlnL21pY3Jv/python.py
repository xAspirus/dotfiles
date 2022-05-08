"string"

'string'

"""doc string"""

r"""multi
line \e
string"""

'''multi
line
string
'''

"\\ \xFF \777"
r"\\ \xFF \777"

'\\ \xFF \777 \u10000000'
r'\\ \xFF \777'

f'{dir()}'

f"Dir() == {dir()} this? {dir()} ?"

# Keywords

TRUE = False
TRUE_1 = True

False      await      else       import     pass
None       break      except     in         raise
True       class      finally    is         return
and        continue   for        lambda     try
as         def        from       nonlocal   while
assert     del        global     not        with
async      elif       if         or         yield

if __name__ == "__main__":
	cry()

# Numbers

7     2147483647                        0o177    0b100110111
3     79228162514264337593543950336     0o377    0xdeadbeef
      100_000_000_000                   0b_1110_0101 1_2_3

3.14    10.    .001    1e100    3.14e-10    0e0    3.14_15_93

+       -       *       **      /       //      %      @
<<      >>      &       |       ^       ~       :=
<       >       <=      >=      ==      !=

def function_generator():
	return lambda x: x**2

generator.__next__()
obj.close()

>>> def echo(value=None):
...     print("Execution starts when 'next()' is called for the first time.")
...     try:
...         while True:
...             try:
...                 value = (yield value)
...             except Exception as e:
...                 value = e
...     finally:
...         print("Don't forget to clean up when 'close()' is called.")

if __debug__:
    if not expression1: raise AssertionError(expression2)

int()
float()
complex()
list()
tuple()
range()
str()
bytes()
bytearray()
memoryview()
set()
frozenset()
dict()

class MyClass:
	pass

# comma is blue
, 'string' , 'string' : 2 3 4 5 2 Function() {}

FunctionCall(arg1, arg2)
FunctionCall('arg1', 'arg2')
