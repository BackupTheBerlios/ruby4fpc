(*********************************************************************
  RUBY INTERFACE CONVERSTION PROJECT : Ruby4FPC
  Author: Jon (BadQuanta) Sawyer
*********************************************************************)
{$LONGSTRINGS ON} //We are dealing w/ a C Library.. this is just easier.
UNIT Ruby;
Interface
  Uses
  //Following Required to Link to ruby
    Initc,  DynLibs;
  {$linklib gcc}
  {$linklib stdc++}
  {$linklib crypt}
  //Special Thanks to Olibole on FreeNode#FPC

  // This Macro helps alot.
  {$MACRO ON}
    {$DEFINE RubyExt:=External 'ruby-static'}
    {$DEFINE RubyDcl:=CDECL; RubyExt}

  {$Define ReadInt}
    {$I ruby_h.pp}
    {$I intern_h.pp}
  {$UnDef ReadInt}
Implementation

  {$Define ReadImp}
    {$I ruby_h.pp}
    {$I intern_h.pp}
  {$UnDef ReadImp}
end.