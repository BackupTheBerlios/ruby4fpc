// You know what? ALL these macros in ruby.h are bullshit.
{$IFDEF ReadInt}
  Type
    VALUE = LongWord; //typedef unsigned long VALUE;
    ID = LongWord; //typedef unsigned long ID;
    pVALUE = ^VALUE;

  Const
    FIXNUM_FLAG = $01; //#define FIXNUM_FLAG 0x01

  Function  rb_int2inum (along: Longint): VALUE; RubyDcl;//VALUE rb_int2inum _((long));
  Function  INT2FIX(aInt: Longint): VALUE; //#define INT2FIX(i) ((VALUE)(((long)(i))<<1 | FIXNUM_FLAG))
  Function  LONG2FIX(aLong: Longint): VALUE;//#define LONG2FIX(i) INT2FIX(i)
  Function  rb_fix_new(aLong: Lonting): VALUE;//#define rb_fix_new(v) INT2FIX(v)
  Function  rb_int2inum (aLong: Longint):VALUE; RubyDcl;//VALUE rb_int2inum _((long));
  Function  INT2NUM(v:Longint):VALUE;//#define INT2NUM(v) rb_int2inum(v)
  Function  LONG2NUM(v:Longint):VALUE;//#define LONG2NUM(v) INT2NUM(v)
  Function  rb_int_new(v:Longint):VALUE;//#define rb_int_new(v) rb_int2inum(v)
  Function  rb_uint2inum(aLongW: LongWord):VALUE; RubyDcl;//VALUE rb_uint2inum _((unsigned long));
  Function  UINT2NUM(v: Longword):VALUE; //#define UINT2NUM(v) rb_uint2inum(v)
  Function  ULONG2NUM(v: Longword):VALUE; //#define ULONG2NUM(v) UINT2NUM(v)
  Function  rb_uint_new(v: Longword):VALUE;//#define rb_uint_new(v) rb_uint2inum(v)

  Function  rb_ll2inum(v: Int64):VALUE; RubyDcl;//VALUE rb_ll2inum _((LONG_LONG));
  Function  LL2Num(v: Int64):VALUE; //#define LL2NUM(v) rb_ll2inum(v)
  Function  rb_ull2inum(v: QWord):VALUE; RubyDcl;//VALUE rb_ull2inum _((unsigned LONG_LONG));
  Function  ULL2Num(v: QWord):VALUE;//#define ULL2NUM(v) rb_ull2inum(v)

  (* MUST IMPLEMENT LATER *)
  //Function  FIX2LONG(X:VALUE):Longint;//#define FIX2LONG(x) RSHIFT((long)x,1)
  //Function  FIX2ULONG(X:VALUE):Longword;//#define FIX2ULONG(x) (((unsigned long)(x))>>1)
  //Function  FIXNUM_P(#define FIXNUM_P(f) (((long)(f))&FIXNUM_FLAG)
  //#define POSFIXABLE(f) ((f) <= FIXNUM_MAX)
  //#define NEGFIXABLE(f) ((f) >= FIXNUM_MIN)
  //#define FIXABLE(f) (POSFIXABLE(f) && NEGFIXABLE(f))

  Const
    IMMEDIATE_MASK  = $03;//#define IMMEDIATE_MASK 0x03
    SYMBOL_FLAG     = $0e;//#define SYMBOL_FLAG 0x0e
    (*/* special contants - i.e. non-zero and non-fixnum constants */*)
    Qfalse          : VALUE = 0;//#define Qfalse ((VALUE)0)
    Qtrue           : VALUE = 2;//#define Qtrue  ((VALUE)2)
    Qnil            : VALUE = 4;//#define Qnil   ((VALUE)4)
    Qundef          : VALUE = 6;//#define Qundef ((VALUE)6)   /* undefined value for placeholder */

    T_NONE          : $00;//#define T_NONE   0x00

    T_NIL           : $01;//#define T_NIL    0x01
    T_OBJECT        : $02;//#define T_OBJECT 0x02
    T_CLASS         : $03;//#define T_CLASS  0x03
    T_ICLASS        : $04;//#define T_ICLASS 0x04
    T_MODULE        : $05;//#define T_MODULE 0x05
    T_FLOAT         : $06;//#define T_FLOAT  0x06
    T_STRING        : $07;//#define T_STRING 0x07
    T_REGEXP        : $08;//#define T_REGEXP 0x08
    T_ARRAY         : $09;//#define T_ARRAY  0x09
    T_FIXNUM        : $0a;//#define T_FIXNUM 0x0a
    T_HASH          : $0b;//#define T_HASH   0x0b
    T_STRUCT        : $0c;//#define T_STRUCT 0x0c
    T_BIGNUM        : $0d;//#define T_BIGNUM 0x0d
    T_FILE          : $0e;//#define T_FILE   0x0e

    T_TRUE          : $20;//#define T_TRUE   0x20
    T_FALSE         : $21;//#define T_FALSE  0x21
    T_DATA          : $22;//#define T_DATA   0x22
    T_MATCH         : $23;//#define T_MATCH  0x23
    T_SYMBOL        : $24;//#define T_SYMBOL 0x24

    T_BLKTAG        : $3b;//#define T_BLKTAG 0x3b
    T_UNDEF         : $3c;//#define T_UNDEF  0x3c
    T_VARMAP        : $3d;//#define T_VARMAP 0x3d
    T_SCOPE         : $3e;//#define T_SCOPE  0x3e
    T_NODE          : $3f;//#define T_NODE   0x3f

    T_MASK          : $3f;//#define T_MASK   0x3f

  //#define IMMEDIATE_P(x) ((VALUE)(x) & IMMEDIATE_MASK)
  //#define SYMBOL_P(x) (((VALUE)(x)&0xff)==SYMBOL_FLAG)
  //#define ID2SYM(x) ((VALUE)(((long)(x))<<8|SYMBOL_FLAG))
  //#define SYM2ID(x) RSHIFT((long)x,8)

#define RTEST(v) (((VALUE)(v) & ~Qnil) != 0)
#define NIL_P(v) ((VALUE)(v) == Qnil)

#define CLASS_OF(v) rb_class_of((VALUE)(v))



#define BUILTIN_TYPE(x) (((struct RBasic*)(x))->flags & T_MASK)

#define TYPE(x) rb_type((VALUE)(x))

{$ENDIF}
{$IFDEF ReadImp}
  // MACRO TRANSLATIONS

  Function INT2FIX(aInt: Longint): VALUE;  //#define INT2FIX(i) ((VALUE)(((long)(i))<<1 | FIXNUM_FLAG))
  Begin  Result := VALUE((i SHR 1) OR FIXNUM_FLAG);  End;

  Function  LONG2FIX(aLong: Longint): VALUE;  //#define LONG2FIX(i) INT2FIX(i)
  Begin  Result := INT2FIX(aLong);  end;

  Function  rb_fix_new(aLong: Lonting): VALUE;  //#define rb_fix_new(v) INT2FIX(v)
  Begin  Result := INT2FIX(aLong);  end;

  Function  INT2NUM(v:Longint):VALUE;  //#define INT2NUM(v) rb_int2inum(v)
  Begin RESULT := rb_int2inum(v);  End;

  Function  LONG2NUM(v:Longint):VALUE;  //#define LONG2NUM(v) INT2NUM(v)
  Begin RESULT := rb_int2inum(v);  End;

  Function  rb_int_new(v:Longint):VALUE;  //#define rb_int_new(v) rb_int2inum(v)
  Begin Result := rb_int2inum(v);  end;

  Function  UINT2NUM(v: Longword):VALUE; RubyDcl;  //#define UINT2NUM(v) rb_uint2inum(v)
  Begin Result := rb_uint2inum(v);  end;

  Function  ULONG2NUM(v: Longword):VALUE;  //#define ULONG2NUM(v) UINT2NUM(v)
  Begin Result := rb_uint2inum(v);  end;

  Function  rb_uint_new(v: Longword):VALUE;  //#define rb_uint_new(v) rb_uint2inum(v)
  Begin Result := rb_uint2inum(v);  end;

  Function  LL2Num(v: Int64):VALUE; RubyDcl;//#define LL2NUM(v) rb_ll2inum(v)
  Begin Result := rb_ll2inum(v);  End;

  Function  ULL2Num(v: QWord):VALUE;//#define ULL2NUM(v) rb_ull2inum(v)
  Begin Result := rb_ull2inum(v); End;

{$ENDIF}