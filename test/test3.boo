import Boo.Lang.Compiler.Ast
import Boo.Lang.Compiler.MetaProgramming

class Pet:
    public name = "I need a name"

[meta] def onCreate(reference as ReferenceExpression, block as BlockExpression):
    return [|
        $reference = $(pascalCase(reference))()
        $(block.Body)
    |]
    
def pascalCase(r as ReferenceExpression):
    return ReferenceExpression(Name: pascalCase(r.Name))
    
def pascalCase(s as string):
    return s[:1].ToUpper() + s[1:]

app = [|
	onCreate pet:
		print pet.name
|]


asm = compile(app, System.Reflection.Assembly.GetExecutingAssembly())
asm.EntryPoint.Invoke(null, (null,))

