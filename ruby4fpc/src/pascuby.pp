{$Mode OBJFPC}
{$LONGSTRINGS ON}
(*********************************************************************
  Ruby to Object Pascal Naturalization Project
  Author: Jon (BadQuanta) Sawyer
*********************************************************************)
Unit Pascuby;
Interface
  Uses
    Ruby;

  Type
    cRubyToPascalObj = Class
    Protected
      fValue : VALUE;
    Public
      Constructor WrapExisting(aValue: VALUE);
      Function  Dispatch (aMessage : String; aArg : Array of VALUE): VALUE;
    end;



Implementation

  // cRubyToPascalObj -- is exactly what it says.. a wrapper for a
  // ruby object in pascal.
  Constructor cRubytoPascalObj.WrapExisting(aValue: VALUE);
  Begin
    fValue := aValue;
  end;

  Function  cRubytoPascalObj.Dispatch (aMessage : String; aArg : Array of VALUE): VALUE;
  Begin

  end;

end.