var
// vquantidadelinhas: integer;
 vEmEstoque_vg_Coluna, vEmEstoque_filial, vEmEstoque_grupodefilial, vEmEstoque_classe, vEmEstoque_grupo :real;
 vCustoMedio_vg_Coluna, vCustoMedio_filial, vCustoMedio_grupodefilial, vCustoMedio_classe, vCustoMedio_grupo :real;
 vJaPassou, vZebrar : boolean;

procedure Memo8OnBeforePrint(Sender: TfrxComponent);
begin
 vCustoMedio_vg_Coluna := vCustoMedio_vg_Coluna + SUM(IIF(<frxDBEstoque."valorgrade_Coluna">=<frxDBEstoqueGrade."valorgrade_Linha">,<frxDBEstoque."custo_medio">,0),MasterData3,1);
 vCustoMedio_filial := vCustoMedio_filial + SUM(IIF(<frxDBEstoque."valorgrade_Coluna">=<frxDBEstoqueGrade."valorgrade_Linha">,<frxDBEstoque."custo_medio">,0),MasterData3,1);
 vCustoMedio_grupodefilial := vCustoMedio_grupodefilial + SUM(IIF(<frxDBEstoque."valorgrade_Coluna">=<frxDBEstoqueGrade."valorgrade_Linha">,<frxDBEstoque."custo_medio">,0),MasterData3,1);
 vCustoMedio_classe := vCustoMedio_classe + SUM(IIF(<frxDBEstoque."valorgrade_Coluna">=<frxDBEstoqueGrade."valorgrade_Linha">,<frxDBEstoque."custo_medio">,0),MasterData3,1);
 vCustoMedio_grupo := vCustoMedio_grupo + SUM(IIF(<frxDBEstoque."valorgrade_Coluna">=<frxDBEstoqueGrade."valorgrade_Linha">,<frxDBEstoque."custo_medio">,0),MasterData3,1);
end;


procedure Memo12OnBeforePrint(Sender: TfrxComponent);
begin
  vEmEstoque_vg_Coluna     := vEmEstoque_vg_Coluna     + SUM(IIF(<frxDBEstoque."valorgrade_Coluna">=<frxDBEstoqueGrade."valorgrade_Linha">,<frxDBEstoque."Qtdeestoque">,0),MasterData1,1);
  vEmEstoque_filial     := vEmEstoque_filial     + SUM(IIF(<frxDBEstoque."valorgrade_Coluna">=<frxDBEstoqueGrade."valorgrade_Linha">,<frxDBEstoque."Qtdeestoque">,0),MasterData1,1);
  vEmEstoque_grupodefilial     := vEmEstoque_grupodefilial     + SUM(IIF(<frxDBEstoque."valorgrade_Coluna">=<frxDBEstoqueGrade."valorgrade_Linha">,<frxDBEstoque."Qtdeestoque">,0),MasterData1,1);
  vEmEstoque_classe     := vEmEstoque_classe     + SUM(IIF(<frxDBEstoque."valorgrade_Coluna">=<frxDBEstoqueGrade."valorgrade_Linha">,<frxDBEstoque."Qtdeestoque">,0),MasterData1,1);
  vEmEstoque_grupo     := vEmEstoque_grupo     + SUM(IIF(<frxDBEstoque."valorgrade_Coluna">=<frxDBEstoqueGrade."valorgrade_Linha">,<frxDBEstoque."Qtdeestoque">,0),MasterData1,1);
end;


procedure Memo13OnAfterPrint(Sender: TfrxComponent);
begin
  vEmEstoque_vg_Coluna := 0;
end;



procedure Memo18OnAfterPrint(Sender: TfrxComponent);
begin
  vCustoMedio_vg_Coluna := 0;
end;

procedure Memo3OnBeforePrint(Sender: TfrxComponent);
begin
   Memo3.left := 971.33921;
end;

procedure Memo4OnBeforePrint(Sender: TfrxComponent);
begin
   Memo4.left := 971.33921;

end;

procedure Memo6OnBeforePrint(Sender: TfrxComponent);
begin
  Memo6.left := 1020.4731;
end;

procedure PageHeader1OnBeforePrint(Sender: TfrxComponent);
begin
  Memo3.left := 300;
  Memo4.left := 300;
  Memo6.left := 302.3624;
  Memo26.left := 302.3624;
  mmoTitulo.left := 287;
  mmoOutras.left := 287;
  mmoDataSituacao.left := 287;

end;

procedure Memo26OnBeforePrint(Sender: TfrxComponent);
begin
  Memo26.left := 1020.4731;
end;

procedure mmoTituloOnBeforePrint(Sender: TfrxComponent);
begin
  mmoTitulo.left := 630;

end;

procedure mmoOutrasOnBeforePrint(Sender: TfrxComponent);
begin
  mmoOutras.left := 530;
end;

procedure mmoTotalOnBeforePrint(Sender: TfrxComponent);
begin
  if not vJaPassou then
  begin
    mmoTotal.width := mmoTotal.width + (memo5.width*20);
    vJaPassou := true;
  end;
end;


procedure mmoCustoMedioOnBeforePrint(Sender: TfrxComponent);
begin
  if not vJaPassou then
  begin
    mmoCustoMedio.width := mmoCustoMedio.width + (memo5.width*20);
    vJaPassou := true;
  end;
end;

procedure mmoValorFinanceiroOnBeforePrint(Sender: TfrxComponent);
begin
  if not vJaPassou then
  begin
    mmoValorFinanceiro.width := mmoValorFinanceiro.width + (memo5.width*20);
    vJaPassou := true;
  end;
end;

procedure Child1OnAfterPrint(Sender: TfrxComponent);
begin
  mmoTamanhos.left := 305;
end;

procedure mmoTamanhosOnBeforePrint(Sender: TfrxComponent);
begin
//  mmoTamanhos.left := 370;
end;


procedure GroupFooterGrupoOnBeforePrint(Sender: TfrxComponent);
begin
  vZebrar := true;
end;


procedure Memo30OnAfterPrint(Sender: TfrxComponent);
begin
     vEmEstoque_filial := 0;
end;

procedure Memo29OnAfterPrint(Sender: TfrxComponent);
begin
  vCustoMedio_filial := 0;
end;


procedure Memo36OnAfterPrint(Sender: TfrxComponent);
begin
 vEmEstoque_grupodefilial := 0;
end;

procedure Memo35OnAfterPrint(Sender: TfrxComponent);
begin
  vCustoMedio_grupodefilial := 0;
end;

procedure Page1OnBeforePrint(Sender: TfrxComponent);
begin
  GroupFooterGrupodeFilial.visible := <AgruparGrupoFilial>;
  GroupHeaderGrupodeFilial.visible := <AgruparGrupoFilial>;

  GroupHeaderFilial.visible := <AgruparFilial>;
  GroupFooterFilial.visible := <AgruparFilial>;


  GroupHeaderClasse.visible := <AgruparClasseProduto>;
  GroupFooterClasse.visible := <AgruparClasseProduto>;

  GroupHeaderGrupo.visible := <AgruparGrupoProduto>;
  GroupFooterGrupo.visible := <AgruparGrupoProduto>;

end;


procedure Memo53OnAfterPrint(Sender: TfrxComponent);
begin
  vEmEstoque_classe := 0;
end;

procedure Memo52OnAfterPrint(Sender: TfrxComponent);
begin
  vCustoMedio_classe := 0;
end;

procedure GroupFooterGrupoOnAfterPrint(Sender: TfrxComponent);
begin
  vEmEstoque_grupo := 0;
  vCustoMedio_grupo := 0;
end;


procedure mmoDataSituacaoOnBeforePrint(Sender: TfrxComponent);
begin
  mmoDataSituacao.left := 630;
end;

procedure GroupFooterValorGrade_LinhaOnBeforePrint(Sender: TfrxComponent);
begin
  if vZebrar then
  begin
    mmoZebrado.color := <CordoZebrado>;
    vZebrar := false;
  end
  else
  begin
    mmoZebrado.color := clwhite;
    vZebrar := true;
  end;

end;

procedure GroupHeaderValorGrade_LinhaOnBeforePrint(Sender: TfrxComponent);
begin

end;

procedure GroupFooterValorGrade_LinhaOnAfterPrint(Sender: TfrxComponent);
begin
//  vquantidadelinhas:= vquantidadelinhas + 1;
//  GroupFooterGrupo.visible := vquantidadelinhas > 1;
  GroupFooterGrupo.visible := <frxDBEstoqueGrade."quantidadelinhas"> > 1
end;

procedure GroupHeaderGrupoOnAfterPrint(Sender: TfrxComponent);
begin
//  vquantidadelinhas:=0;
end;

begin

end.