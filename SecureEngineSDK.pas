unit SecureEngineSDK;

{$ALIGN ON}
{$MINENUMSIZE 4}

interface

uses
  Windows;

procedure VMStart();stdcall;
procedure VMEnd();stdcall;
procedure CodeReplaceStart();stdcall;
procedure CodeReplaceEnd();stdcall;
procedure RegisteredStart();stdcall;
procedure RegisteredEnd();stdcall;
procedure EncodeStart();stdcall;
procedure EncodeEnd();stdcall;
procedure ClearStart();stdcall;
procedure ClearEnd();stdcall;
procedure MutateStart();stdcall;
procedure MutateEnd();stdcall;
procedure StrEncryptStart();stdcall;
procedure StrEncryptEnd();stdcall;
procedure StrEncryptWStart();stdcall;
procedure StrEncryptWEnd();stdcall;
procedure UnregisteredStart();stdcall;
procedure UnregisteredEnd();stdcall;
procedure RegisteredVMStart();stdcall;
procedure RegisteredVMEnd();stdcall;
procedure UnprotectedStart();stdcall;
procedure UnprotectedEnd();stdcall;
procedure CheckProtection(var user_var:Integer; user_value:Integer);stdcall;
procedure CheckCodeIntegrity(var user_var:Integer; user_value:Integer);stdcall;
procedure CheckRegistration(var user_var:Integer; user_value:Integer);stdcall;
procedure CheckVirtualPC(var user_var:Integer; user_value:Integer);stdcall;

{$I SecureEngineSDK_CustomVMsInterface.pas}


implementation

const

{$IFDEF WIN64}
  SecureEngine = 'SecureEngineSDK64.DLL';
{$ELSE}
  SecureEngine = 'SecureEngineSDK32.DLL';
{$ENDIF}

procedure VMStart; external SecureEngine name 'VMStart';
procedure VMEnd; external SecureEngine name 'VMEnd';
procedure CodeReplaceStart; external SecureEngine name 'CodeReplaceStart';
procedure CodeReplaceEnd; external SecureEngine name 'CodeReplaceEnd';
procedure RegisteredStart; external SecureEngine name 'RegisteredStart';
procedure RegisteredEnd; external SecureEngine name 'RegisteredEnd';
procedure EncodeStart; external SecureEngine name 'EncodeStart';
procedure EncodeEnd; external SecureEngine name 'EncodeEnd';
procedure ClearStart; external SecureEngine name 'ClearStart';
procedure ClearEnd; external SecureEngine name 'ClearEnd';
procedure MutateStart; external SecureEngine name 'MutateStart';
procedure MutateEnd; external SecureEngine name 'MutateEnd';
procedure StrEncryptStart; external SecureEngine name 'StrEncryptStart';
procedure StrEncryptEnd; external SecureEngine name 'StrEncryptEnd';
procedure StrEncryptWStart; external SecureEngine name 'StrEncryptWStart';
procedure StrEncryptWEnd; external SecureEngine name 'StrEncryptWEnd';
procedure UnregisteredStart; external SecureEngine name 'UnregisteredStart';
procedure UnregisteredEnd; external SecureEngine name 'UnregisteredEnd';
procedure RegisteredVMStart; external SecureEngine name 'RegisteredVMStart';
procedure RegisteredVMEnd; external SecureEngine name 'RegisteredVMEnd';
procedure UnprotectedStart; external SecureEngine name 'UnprotectedStart';
procedure UnprotectedEnd; external SecureEngine name 'UnprotectedEnd';
procedure CheckProtection; external SecureEngine name 'SECheckProtection';
procedure CheckCodeIntegrity; external SecureEngine name 'SECheckCodeIntegrity';
procedure CheckRegistration; external SecureEngine name 'SECheckRegistration';
procedure CheckVirtualPC; external SecureEngine name 'SECheckVirtualPC';

{$I SecureEngineSDK_CustomVMsImplementation.pas}

end.

