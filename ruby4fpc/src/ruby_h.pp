// Author: Jon (BadQuanta) Sawyer
{$IFDEF ReadInt}
  Type VALUE = LongWord;  // 79 - typedef unsigned long VALUE;
  Type ID = LongWord; // 80 - typedef unsigned long ID;
  Function  rb_eval_string (aString: String): VALUE; RubyDcl; //517 - VALUE rb_eval_string _((const char*));
  Procedure ruby_init(); RubyDcl; //562 - void ruby_init _((void));
{$ENDIF}
{$IFDEF ReadImp}

{$ENDIF}