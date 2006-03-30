// Author: Jon (BadQuanta) Sawyer
Program Ruby_Shell;
Uses TestCase, Ruby;

Var
	ruby_val : Ruby.VALUE;
Const
	Expr : String = '2 * 2';
	Answer : Integer = 4;

Begin
	assert(rubyinit(argc, argv),0,'Initialize Ruby');	
	val := rb_eval(expr);
	assert(FIXEDNUM(ruby_val), Answer, 'Ruby test expresion');
	assert(rubyquit(), 0, 'Shutdown Ruby');
end.