#!/usr/local/bin/ruby

MAXLENTH = 255;

class Token
	public
		attr_reader :str, :symbol;
	private	
		def initialize(aStr, aSymbol)
			@str = aStr;
			@symbol = aSymbol;
		end;
end;

class Tokenizer < File
	private
		def initialize(aFile)
			super(aFile)
			@tokenList = Array.new;
		end;

		def match(aString)
			token = nil;
			@tokenList.each() {|aToken|				
				if aToken.str == aString
					token = aToken;

				end
			}
			return token;
		end;
		
				
	public
		
		def tokenize()
			theString = String.new;
			each_byte() { |aByte|
				if aByte == ?\s then
					aToken = match(theString)
					if aToken == nil then
						Kernel::puts "IDENTIFYER("+theString+")";
					end;
					theString = "";					
				else
					theString.concat(aByte);

					aToken = match(theString)
					if aToken != nil
						Kernel::puts aToken.symbol;
						theString = "";
					end
				end;
			}
		end;
	
		def addToken(aStr, aSymbol)
			aToken = Token.new(aStr, aSymbol);
			@tokenList.push(aToken);					
		end;
end;


myFile = Tokenizer.open("test.h");
myFile.addToken( "\n" , "NEWLINE" );
myFile.addToken( " ", "SPACE" );
myFile.addToken( "(", "LEFT_PARENTHESES");
myFile.addToken( ")", "RIGHT_PARENTHESES");
myFile.addToken( "/", "FORWARD_SLASH");
myFile.addToken( "*", "ASTERIK");
myFile.addToken( "+", "PLUS");
myFile.addToken( "=", "EQUALS");
myFile.addToken( ";", "SEMICOLON");

myFile.tokenize();