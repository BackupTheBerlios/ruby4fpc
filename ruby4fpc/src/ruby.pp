(*********************************************************************
  RUBY INTERFACE CONVERSTION PROJECT : Ruby4FPC
*********************************************************************)
(*Original Copyright Notification*************************************
  ruby.h -
  $Author: jonsawyer $
  created at: Thu Jun 10 14:26:32 JST 1993
  Copyright (C) 1993-2003 Yukihiro Matsumoto
  Copyright (C) 2000  Network Applied Communication Laboratory, Inc.
  Copyright (C) 2000  Information-technology Promotion Agency, Japan
**********************************************************************)

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

  {$Def ReadImp}
    {$I ruby_h.pp}
    {$I intern_h.pp}
  {$EndIf}

Implementation

  {$Def ReadImp}
    {$I ruby_h.pp}
    {$I intern_h.pp}
  {$EndIf}

End.