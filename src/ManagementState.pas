unit ManagementState;

interface

uses
  ManagementState.Interf,
  System.Generics.Collections;

type
  TManagementState = class(TInterfacedObject, IManagementState)
  private
    FList: TDictionary<string, IInterface>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IManagementState;

    function add(const key: string; const value: IInterface): IManagementState;
    function remove(const key: string): IManagementState;
    function get(const key: string): IInterface;
  end;

implementation

uses
  SysUtils;

{ TManagementState }

function TManagementState.add(const key: string; const value: IInterface): IManagementState;
begin
  Result := Self;
  FList.AddOrSetValue(key, value);
  FList.TrimExcess;
end;

constructor TManagementState.Create;
begin
  FList := TDictionary<string, IInterface>.Create;
end;

destructor TManagementState.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

function TManagementState.get(const key: string): IInterface;
begin
  Result := FList.Items[key];
end;

class function TManagementState.New: IManagementState;
begin
  Result := Self.Create;
end;

function TManagementState.remove(const key: string): IManagementState;
begin
  Result := Self;
  FList.Remove(key);
  FList.TrimExcess;
end;

end.
