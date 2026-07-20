unit rgtecsoft;

interface

procedure Register;

implementation

uses
  //CLX
  classes, DesignIntf, TypInfo,
  //Componentes
  cpdatabase, cpquery, cptable, cptransact, cpnotify, cpdatasource,
  cpcep, cpcnpj, cpcpf, cpdata, cpdbdata, cpdbmesano, cpdbdiames, cpdocumento, cpfone, cptexto,
  cpcpfcnpj,  cpcpfcnpj2, cpmascara, cpdbgrid, cpdbspinedit,
  cpdbmemo, cpmemo, cpnumero, cpdbtext, cpdbfindcontrols, peparameters, cpdoubledts,
  {cpsacclient,} cppagecontrol, cpeditioncontrolvalidation, cpdbcombobox, cpdbradiogroup,
  ceeditioncontrolvalidationeditor, cpdblookupcombobox, QMonthCalendar, cpdbedittext,
  DBMaplistCombobox, Dbluplus, DBLup2, DBTabControl, BiDiDBNavigator, DBDateTimePicker, DBDateTimePicker2,
  DBEditDateTimePicker, DBIntCheckBox, PCheck, PDBCheck, lpLstBox, IDGconst, About, FLabel, ofxreader {, AlphaShowHide};

procedure Register;
begin
  RegisterComponents('tecSOFT', [TtecDatabase, TtecQuery, TtecTable, TtecTransact,
                                 TtecNotify, TtecDataSource, {TtecSacTcpServer,}
                                 TtecDbEditFind, TtecDBFindLookup, TDBEditCep,
                                 TDBEditCNPJ, TDBEditmascara,
                                 TDBEditCPF, TDBEditData, TDBEditMesAno, TDBEditDiaMes,
                                 TDBEditDocumento, TDBEditFone, TDBEditNumero,
                                 TDBEditNumeroIBGE,
                                 TDBSpinEdit, TEditNumero,
                                 TDBEditTexto, TEditTexto, TEditData, TEditHora, TtecDBGrid, TtecDBMemo, TtecMemo, TtecDBText,
                                 TtecDoubleDBEdit, TEditMesAno, TtecPageControl, TDBEditCPFCNPJ, TDBEditCPFCNPJ2,
                                 TEditHora, TEditDiaMes, TEditDia, TEditMes,
                                 TtecEditionControlValidation, TtecDBComboBox, TTecDBLookupComboBox, TtecRadioButton, TtecDBRadioGroup,
                                 TMonthCalendar2, TMonthCalendarCombo2, TDBEditText, TDBMaplistCombobox, TDBLookupComboPlus,
                                 TDBTabControl,TBiDiDBNavigator, TDBDateTimePicker, TDBDateTimePicker2, TDBEditDateTimePicker,
                                 TDBIntCheckBox, TPCheck, TPDBCheck, TIDGDBListBox,TFLabel, TOFXReader]);

                                {TAlphaShowHide}

{  RegisterPropertyEditor(TypeInfo(string), TtecFindCustom, 'Group',  TtecParametersEditor);}
  RegisterPropertyEditor(TypeInfo(string), TtecFindCustom, 'QueryParameter',  TtecParametersEditor);
{  RegisterPropertyEditor(TypeInfo(string), TtecFindCustom, 'LookupField',  TtecParametersEditor);}
  RegisterPropertyEditor(TypeInfo(string), TtecDBFindLookup, 'LookupQueryParameter',  TtecLookupParametersEditor);
  RegisterPropertyEditor(TypeInfo(string), TtecDBFindLookup, 'LookupField',  TtecDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TtecDoubleDBEdit, 'LookupField',  TtecDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TtecFindCustom, 'DataaFieldInterno',  TtecDataProperty);
  RegisterPropertyEditor(TypeInfo(string), TtecFindCustom, 'DataaFieldVisual',  TtecDataProperty);
  RegisterPropertyEditor(TypeInfo(string), TtecDBFindLookup, 'LookupaFieldInterno',  TtecDataFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TtecDBFindLookup, 'LookupaFieldVisual',  TtecDataFieldProperty);
//  RegisterPropertyEditor(TypeInfo(string), TDBMaplistCombobox, 'DataField',  TtecDataProperty);
  RegisterComponentEditor(TtecEditionControlValidation, TtecEditionControlValidationEditor);
  RegisterPropertyEditor(TypeInfo(string), TDBLookupComboPlus, 'LookupIndex', TIndexNameProperty);

  RegisterPropertyEditor(TypeInfo(TFieldParams),TIDGDBListBox,'FieldsList',TFieldParamsProperty);
  RegisterPropertyEditor(TypeInfo(string),TIDGDBListBox,'FieldName',TFieldBoxProperty);
  RegisterPropertyEditor(TypeInfo(string),TIDGDBListBox,'FieldCheck',TFieldBoxProperty);
  RegisterPropertyEditor(TypeInfo(string),TIDGDBListBox,'FieldID',TFieldBoxProperty);
  RegisterComponentEditor(TDBLookupComboPlus, TDBLookupComponentEditor);
  RegisterComponentEditor(TIDGDBListBox, TAboutEditor);



end;

end.
