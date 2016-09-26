object DmPrinc: TDmPrinc
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 255
  Width = 429
  object sqlCon: TSQLConnection
    ConnectionName = 'VETSHOP'
    DriverName = 'Oracle'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Oracle'
      'DriverUnit=Data.DBXOracle'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver180.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=18.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXOracleMetaDataCommandFactory,DbxOracle' +
        'Driver180.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXOracleMetaDataCommandFac' +
        'tory,Borland.Data.DbxOracleDriver,Version=18.0.0.0,Culture=neutr' +
        'al,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxora.dll'
      'LibraryNameOsx=libsqlora.dylib'
      'VendorLib=oci.dll'
      'VendorLibWin64=oci.dll'
      'VendorLibOsx=libociei.dylib'
      'Database=XE'
      'User_Name=VETSHOP'
      'Password=VETSHOP123'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'RowsetSize=20'
      'OSAuthentication=False'
      'MultipleTransactions=False'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'OS Authentication=False'
      'Multiple Transaction=False'
      'Trim Char=False'
      'Decimal Separator=.')
    AfterConnect = sqlConAfterConnect
    Connected = True
    Left = 24
    Top = 16
  end
  object dspClientes: TDataSetProvider
    DataSet = sqlClientes
    Left = 224
    Top = 72
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 152
    Top = 72
    object cdsClientesCD_PESSOA: TFMTBCDField
      FieldName = 'CD_PESSOA'
      Required = True
      Precision = 32
    end
    object cdsClientesNM_PESSOA: TWideStringField
      FieldName = 'NM_PESSOA'
      Required = True
      Size = 60
    end
    object cdsClientesTP_PESSOA: TFMTBCDField
      FieldName = 'TP_PESSOA'
      Required = True
      Precision = 32
    end
  end
  object sqlClientes: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM PESSOA')
    SQLConnection = sqlCon
    Left = 296
    Top = 72
  end
end
