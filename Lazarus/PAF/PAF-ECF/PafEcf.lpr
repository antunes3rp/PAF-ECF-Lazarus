program PafEcf;

{$mode objfpc}{$H+}

uses
  Forms,
  LCLIntf, LCLType, LMessages,
  Dialogs, Interfaces,
  BancoVO in 'VO\BancoVO.pas',
  CFOPVO in 'VO\CFOPVO.pas',
  ClienteVO in 'VO\ClienteVO.pas',
  DAVDetalheVO in 'VO\DAVDetalheVO.pas',
  PreVendaDetalheVO in 'VO\PreVendaDetalheVO.pas',
  R02VO in 'VO\R02VO.pas',
  R03VO in 'VO\R03VO.pas',
  R06VO in 'VO\R06VO.pas',
  R07VO in 'VO\R07VO.pas',
  SituacaoClienteVO in 'VO\SituacaoClienteVO.pas',
  ProdutoController in 'Controller\ProdutoController.pas',
  VendaController in 'Controller\VendaController.pas',
  UCaixa in 'Tela\UCaixa.pas' {FCaixa},
  UDataModule in 'DataModule\UDataModule.pas' {FDataModule: TDataModule},
  UDescontoAcrescimo in 'Tela\UDescontoAcrescimo.pas' {FDescontoAcrescimo},
  UEfetuaPagamento in 'Tela\UEfetuaPagamento.pas' {FEfetuaPagamento},
  UIdentificaCliente in 'Tela\UIdentificaCliente.pas' {FIdentificaCliente},
  UImportaCliente in 'Tela\UImportaCliente.pas' {FImportaCliente},
  UImportaNumero in 'Tela\UImportaNumero.pas' {FImportaNumero},
  UIniciaMovimento in 'Tela\UIniciaMovimento.pas' {FIniciaMovimento},
  UMovimentoAberto in 'Tela\UMovimentoAberto.pas' {FMovimentoAberto},
  UValorReal in 'Tela\UValorReal.pas' {FValorReal},
  ProdutoPromocaoVO in 'VO\ProdutoPromocaoVO.pas',
  UImportaProduto in 'Tela\UImportaProduto.pas' {FImportaProduto},
  Biblioteca in 'Util\Biblioteca.pas',
  PreVendaController in 'Controller\PreVendaController.pas',
  DAVController in 'Controller\DAVController.pas',
  Sintegra60AVO in 'VO\Sintegra60AVO.pas',
  Sintegra60MVO in 'VO\Sintegra60MVO.pas',
  ULoginGerenteSupervisor in 'Tela\ULoginGerenteSupervisor.pas' {FLoginGerenteSupervisor},
  UVendasPeriodo in 'Tela\UVendasPeriodo.pas' {FVendasPeriodo},
  R01VO in 'VO\R01VO.pas',
  Constantes in 'Util\Constantes.pas',
  UCargaPDV in 'Tela\UCargaPDV.pas' {FCargaPDV},
  UFechaEfetuaPagamento in 'Tela\UFechaEfetuaPagamento.pas' {FFechaEfetuaPagamento},
  UFichaTecnica in 'Tela\UFichaTecnica.pas' {FFichaTecnica},
  UParcelamento in 'Tela\UParcelamento.pas' {FParcelamento},
  ULocaliza in 'Tela\ULocaliza.pas' {FLocaliza},
  USplash in 'Tela\USplash.pas' {FSplash},
  UEncerraMovimento in 'Tela\UEncerraMovimento.pas' {FEncerraMovimento},
  UCheques in 'Tela\UCheques.pas' {FCheques},
  LogImportacaoVO in 'VO\LogImportacaoVO.pas',
  ULogImportacao in 'Tela\ULogImportacao.pas' {FLogImportacao},
  UNotaFiscal in 'Tela\UNotaFiscal.pas' {FNotaFiscal},
  DavCabecalhoVO in 'VO\DavCabecalhoVO.pas',
  ContasParcelasVO in 'VO\ContasParcelasVO.pas',
  ContasPagarReceberVO in 'VO\ContasPagarReceberVO.pas',
  NotaFiscalDetalheVO in 'VO\NotaFiscalDetalheVO.pas',
  NotaFiscalCabecalhoVO in 'VO\NotaFiscalCabecalhoVO.pas',
  UnidadeProdutoVO in 'VO\UnidadeProdutoVO.pas',
  PreVendaCabecalhoVO in 'VO\PreVendaCabecalhoVO.pas',
  UPenDrive in 'Tela\UPenDrive.pas' {FPenDrive},
  UMenuFiscal in 'Tela\UMenuFiscal.pas' {FMenuFiscal},
  VO in 'VO\VO.pas',
  EcfAliquotasVO in 'VO\EcfAliquotasVO.pas',
  EcfCaixaVO in 'VO\EcfCaixaVO.pas',
  EcfChequeClienteVO in 'VO\EcfChequeClienteVO.pas',
  EcfConfiguracaoVO in 'VO\EcfConfiguracaoVO.pas',
  EcfContadorVO in 'VO\EcfContadorVO.pas',
  EcfDocumentosEmitidosVO in 'VO\EcfDocumentosEmitidosVO.pas',
  EcfEmpresaVO in 'VO\EcfEmpresaVO.pas',
  EcfFechamentoVO in 'VO\EcfFechamentoVO.pas',
  EcfFuncionarioVO in 'VO\EcfFuncionarioVO.pas',
  EcfImpressoraVO in 'VO\EcfImpressoraVO.pas',
  EcfMovimentoVO in 'VO\EcfMovimentoVO.pas',
  EcfOperadorVO in 'VO\EcfOperadorVO.pas',
  EcfPosicaoComponentesVO in 'VO\EcfPosicaoComponentesVO.pas',
  EcfRecebimentoNaoFiscalVO in 'VO\EcfRecebimentoNaoFiscalVO.pas',
  EcfResolucaoVO in 'VO\EcfResolucaoVO.pas',
  EcfSangriaVO in 'VO\EcfSangriaVO.pas',
  EcfSuprimentoVO in 'VO\EcfSuprimentoVO.pas',
  EcfTipoPagamentoVO in 'VO\EcfTipoPagamentoVO.pas',
  EcfTurnoVO in 'VO\EcfTurnoVO.pas',
  EcfVendaCabecalhoVO in 'VO\EcfVendaCabecalhoVO.pas',
  EcfVendaDetalheVO in 'VO\EcfVendaDetalheVO.pas',
  FichaTecnicaVO in 'VO\FichaTecnicaVO.pas',
  UBase in 'Tela\UBase.pas' {FBase},
  UDataModuleConexao in 'DataModule\UDataModuleConexao.pas' {FDataModuleConexao: TDataModule},
  SessaoUsuario in 'Util\SessaoUsuario.pas',
  Controller in 'Controller\Controller.pas',
  T2TiORM in 'Util\T2TiORM.pas',
  Tipos in 'Util\Tipos.pas',
  EcfConfiguracaoController in 'Controller\EcfConfiguracaoController.pas',
  EcfMovimentoController in 'Controller\EcfMovimentoController.pas',
  EcfSuprimentoController in 'Controller\EcfSuprimentoController.pas',
  EcfSangriaController in 'Controller\EcfSangriaController.pas',
  EcfAliquotasController in 'Controller\EcfAliquotasController.pas',
  BancoController in 'Controller\BancoController.pas',
  EcfChequeClienteController in 'Controller\EcfChequeClienteController.pas',
  ClienteController in 'Controller\ClienteController.pas',
  EcfContadorController in 'Controller\EcfContadorController.pas',
  EcfFechamentoController in 'Controller\EcfFechamentoController.pas',
  FichaTecnicaController in 'Controller\FichaTecnicaController.pas',
  EcfImpressoraController in 'Controller\EcfImpressoraController.pas',
  NotaFiscalCabecalhoController in 'Controller\NotaFiscalCabecalhoController.pas',
  NotaFiscalDetalheController in 'Controller\NotaFiscalDetalheController.pas',
  EcfFuncionarioController in 'Controller\EcfFuncionarioController.pas',
  EcfTipoPagamentoController in 'Controller\EcfTipoPagamentoController.pas',
  R01Controller in 'Controller\R01Controller.pas',
  EcfConfiguracaoBalancaVO in 'VO\EcfConfiguracaoBalancaVO.pas',
  EcfRelatorioGerencialVO in 'VO\EcfRelatorioGerencialVO.pas',
  EcfConfiguracaoLeitorSerVO in 'VO\EcfConfiguracaoLeitorSerVO.pas',
  EcfTotalTipoPagamentoVO in 'VO\EcfTotalTipoPagamentoVO.pas',
  EcfTotalTipoPagamentoController in 'Controller\EcfTotalTipoPagamentoController.pas',
  EcfTurnoController in 'Controller\EcfTurnoController.pas',
  ULMF in 'Tela\ULMF.pas' {FLMF},
  ViewTotalPagamentoDataVO in 'VO\ViewTotalPagamentoDataVO.pas',
  ViewTotalPagamentoMovimentoVO in 'VO\ViewTotalPagamentoMovimentoVO.pas',
  ViewTotalPagamentoMovimentoController in 'Controller\ViewTotalPagamentoMovimentoController.pas',
  ViewTotalPagamentoDataController in 'Controller\ViewTotalPagamentoDataController.pas',
  URegistrosPAF in 'Tela\URegistrosPAF.pas' {FRegistrosPAF},
  R02Controller in 'Controller\R02Controller.pas',
  R06Controller in 'Controller\R06Controller.pas',
  PAFUtil in 'Util\PAFUtil.pas',
  Sintegra60MController in 'Controller\Sintegra60MController.pas',
  ECFUtil in 'Util\ECFUtil.pas',
  LogssVO in 'VO\LogssVO.pas',
  LogssController in 'Controller\LogssController.pas',
  EcfE3VO in 'VO\EcfE3VO.pas',
  EcfE3Controller in 'Controller\EcfE3Controller.pas',
  EcfProdutoVO in 'VO\EcfProdutoVO.pas',
  PreVendaDetalheController in 'Controller\PreVendaDetalheController.pas',
  DavDetalheController in 'Controller\DavDetalheController.pas',
  DavDetalheAlteracaoVO in 'VO\DavDetalheAlteracaoVO.pas';

{$R *.res}


var
  Instancia: THandle;
begin

  begin
    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.Title := 'PAF-ECF';
    Application.CreateForm(TFCaixa, FCaixa);
    Application.Run;
  end;

end.
