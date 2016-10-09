object DmPrinc: TDmPrinc
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 226
  Width = 391
  object sqlCon: TSQLConnection
    ConnectionName = 'VETSHOP'
    DriverName = 'Interbase'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'DriverUnit=Data.DBXInterBase'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver230.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=23.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXInterbaseMetaDataCommandFactory,DbxInt' +
        'erBaseDriver230.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXInterbaseMetaDataCommand' +
        'Factory,Borland.Data.DbxInterBaseDriver,Version=23.0.0.0,Culture' +
        '=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'LibraryName=dbxint.dll'
      'LibraryNameOsx=libsqlib.dylib'
      'VendorLib=GDS32.DLL'
      'VendorLibWin64=ibclient64.dll'
      'VendorLibOsx=libgds.dylib'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'DisplayDriverName=InterBase Server'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False'
      'SEP='
      
        'Database=C:\Users\ferna\Dropbox\Git\ProjetoFinal\Dados\VETSHOP.F' +
        'DB')
    Left = 25
    Top = 16
  end
  object dsp: TDataSetProvider
    DataSet = sql
    Left = 22
    Top = 78
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 133
    Top = 76
    object cdsCD_PESSOA: TFMTBCDField
      FieldName = 'CD_PESSOA'
      Required = True
      Precision = 32
    end
    object cdsNM_PESSOA: TWideStringField
      FieldName = 'NM_PESSOA'
      Required = True
      Size = 60
    end
    object cdsTP_PESSOA: TFMTBCDField
      FieldName = 'TP_PESSOA'
      Required = True
      Precision = 32
    end
  end
  object sql: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM PESSOA')
    SQLConnection = sqlCon
    Left = 75
    Top = 76
  end
end
