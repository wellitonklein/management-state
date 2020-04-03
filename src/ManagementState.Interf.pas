unit ManagementState.Interf;

interface

type
  IManagementState = interface;

  IManagementState = interface
    ['{B9A407A1-E0D4-45E2-BF46-1C608B284A19}']
    function add(const key: string; const value: IInterface): IManagementState;
    function remove(const key: string): IManagementState;
    function get(const key: string): IInterface;
  end;

implementation

end.
