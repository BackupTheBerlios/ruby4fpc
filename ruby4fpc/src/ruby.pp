(*********************************************************************
  RUBY INTERFACE CONVERSTION PROJECT : Ruby4FPC
*********************************************************************)
(*Original Copyright Notification*************************************
  ruby.h -
  created at: Thu Jun 10 14:26:32 JST 1993
  Copyright (C) 1993-2003 Yukihiro Matsumoto
  Copyright (C) 2000  Network Applied Communication Laboratory, Inc.
  Copyright (C) 2000  Information-technology Promotion Agency, Japan
**********************************************************************)
{$H+}
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