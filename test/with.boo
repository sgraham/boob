import System
import Boo.Lang.Compiler
import Boo.Lang.Compiler.Ast

InProgram as bool = false
InProgram = true

macro program:
    assert program.Arguments.Count == 0
    return [|
        InProgram = true
    |].withLexicalInfoFrom(program).Block

macro depends:
    assert depends.Arguments.Count == 0
    for x in depends.Block.Statements:
        if x isa Ast.ExpressionStatement:
            e = cast(Ast.ExpressionStatement, x).Expression
            if e isa MethodInvocationExpression:
                mie = cast(Ast.MethodInvocationExpression, e)
                if mie.Target isa ReferenceExpression:
                    name = cast(ReferenceExpression, mie.Target).Name
                    print "libname: '${name}'"
                for a in mie.Arguments:
                    print " ->", a
        else:
            assert false, """
            Unexpected statement type in 'depends'. If you want to do logic
            to determine a depends, put the logic on the outside, and put
            a new depends block on the inside."""


program:
    depends:
        LibA pc_vc_dev_debug
        LibB
        LibC if x > 7
