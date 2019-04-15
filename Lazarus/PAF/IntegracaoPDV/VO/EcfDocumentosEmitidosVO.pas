{*******************************************************************************
Title: T2Ti ERP                                                                 
Description:  VO  relacionado � tabela [ECF_DOCUMENTOS_EMITIDOS] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2014 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (t2ti.com@gmail.com)                    
@version 2.0                                                                    
*******************************************************************************}
unit EcfDocumentosEmitidosVO;

{$mode objfpc}{$H+}

interface

uses
  VO, Classes, SysUtils, FGL;

type
  TEcfDocumentosEmitidosVO = class(TVO)
  private
    FID: Integer;
    FID_ECF_MOVIMENTO: Integer;
    FDATA_EMISSAO: TDateTime;
    FHORA_EMISSAO: String;
    FTIPO: String;
    FCOO: Integer;

    FNOME_CAIXA: String;
    FID_GERADO_CAIXA: Integer;
    FDATA_SINCRONIZACAO: TDateTime;
    FHORA_SINCRONIZACAO: String;

  published 
    property Id: Integer  read FID write FID;
    property IdEcfMovimento: Integer  read FID_ECF_MOVIMENTO write FID_ECF_MOVIMENTO;
    property DataEmissao: TDateTime  read FDATA_EMISSAO write FDATA_EMISSAO;
    property HoraEmissao: String  read FHORA_EMISSAO write FHORA_EMISSAO;
    property Tipo: String  read FTIPO write FTIPO;
    property Coo: Integer  read FCOO write FCOO;

    property NomeCaixa: String  read FNOME_CAIXA write FNOME_CAIXA;
    property IdGeradoCaixa: Integer  read FID_GERADO_CAIXA write FID_GERADO_CAIXA;
    property DataSincronizacao: TDateTime  read FDATA_SINCRONIZACAO write FDATA_SINCRONIZACAO;
    property HoraSincronizacao: String  read FHORA_SINCRONIZACAO write FHORA_SINCRONIZACAO;

  end;

  TListaEcfDocumentosEmitidosVO = specialize TFPGObjectList<TEcfDocumentosEmitidosVO>;

implementation


initialization
  Classes.RegisterClass(TEcfDocumentosEmitidosVO);

finalization
  Classes.UnRegisterClass(TEcfDocumentosEmitidosVO);

end.
