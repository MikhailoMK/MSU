library Project1;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters.

  Important note about VCL usage: when this DLL will be implicitly
  loaded and this DLL uses TWicImage / TImageCollection created in
  any unit initialization section, then Vcl.WicImageInit must be
  included into your library's USES clause. }

uses
  System.SysUtils,
  System.Classes;

type
  iARRAY = ARRAY [1..100] OF INTEGER;
  iARRAY1 = ARRAY[1..100] of Double;
  SARRAY = ARRAY[1..100] of string;

{$R *.res}
procedure Swap(var a, b: Integer);
var
    temp: Integer;
  begin
    temp := a;
    a := b;
    b := temp;
  end;

function IntegerNumber(arr : iARRAY; size : integer; mode : boolean = true):iarray; stdcall;
var i,j:integer;
  flag : boolean;
begin
  flag := true;
  while flag do
  begin
    flag := false;
    for i := 1 to size-1 do
      begin
        if mode then
        begin
          if arr[i] > arr[i+1] then
          begin
            j := arr[i+1];
            arr[i+1] := arr[i];
            arr[i] := j;
            flag := true;
          end;
        end
        else
        begin
          if arr[i] < arr[i+1] then
          begin
            j := arr[i+1];
            arr[i+1] := arr[i];
            arr[i] := j;
            flag := true;
          end;
        end;
      end;
  end;
  result := arr;
end;

procedure QuickSort(var arr: iarray; left, right: Integer; ascending: Boolean);stdcall;
var
  i, j, pivot: Integer;
begin
  if left < right then
  begin
    pivot := arr[(left + right) div 2];
    i := left;
    j := right;
    while i <= j do
    begin
        if ascending then
        begin
          while arr[i] < pivot do
            Inc(i);
          while arr[j] > pivot do
            Dec(j);
        end
        else
        begin
        while arr[i] > pivot do
            Inc(i);
          while arr[j] < pivot do
            Dec(j);
        end;
      if i <= j then
      begin
        Swap(arr[i], arr[j]);
        Inc(i);
        Dec(j);
      end;
    end;
    QuickSort(arr, left, j, ascending);
    QuickSort(arr, i, right, ascending);
  end;
end;


function FloatNumber(arr : iARRAY1; size : integer; mode : boolean = true):iarray1; stdcall;
  var i:integer;
      j:double;
      flag : boolean;
begin
  flag := true;
  while flag do
  begin
    flag := false;
    for i := 1 to size-1 do
      begin
        if mode then
        begin
          if arr[i] > arr[i+1] then
          begin
            j := arr[i+1];
            arr[i+1] := arr[i];
            arr[i] := j;
            flag := true;
          end;
        end
        else
        begin
          if arr[i] < arr[i+1] then
          begin
            j := arr[i+1];
            arr[i+1] := arr[i];
            arr[i] := j;
            flag := true;
          end;
        end;
      end;
  end;
  result := arr;
end;

function StringSort(arr : SArray; size : integer; mode : boolean = true):sarray;stdcall;
 var i:integer;
      j:string;
      flag : boolean;
begin
  flag := true;
  while flag do
  begin
    flag := false;
    for i := 1 to size-1 do
      begin
        if mode then
        begin
          if arr[i] > arr[i+1] then
          begin
            j := arr[i+1];
            arr[i+1] := arr[i];
            arr[i] := j;
            flag := true;
          end;
        end
        else
        begin
          if arr[i] < arr[i+1] then
          begin
            j := arr[i+1];
            arr[i+1] := arr[i];
            arr[i] := j;
            flag := true;
          end;
        end;
      end;
  end;
  result := arr;
end;

 procedure Merge(var arr: sArray; left, middle, right: Integer; ascending: Boolean);
var
  i, j, k: Integer;
  n1, n2: Integer;
  L, R: sArray;
begin
  n1 := middle - left + 1;
  n2 := right - middle;

  for i := 1 to n1 do
    L[i] := arr[left + i - 1];

  for j := 1 to n2 do
    R[j] := arr[middle + j];

  i := 1;
  j := 1;
  k := left;

  while (i <= n1) and (j <= n2) do
  begin
    if ascending then
    begin
      if L[i] <= R[j] then
      begin
        arr[k] := L[i];
        Inc(i);
      end
      else
      begin
        arr[k] := R[j];
        Inc(j);
      end;
    end
    else
    begin
      if L[i] >= R[j] then
      begin
        arr[k] := L[i];
        Inc(i);
      end
      else
      begin
        arr[k] := R[j];
        Inc(j);
      end;
    end;

    Inc(k);
  end;

  while i <= n1 do
  begin
    arr[k] := L[i];
    Inc(i);
    Inc(k);
  end;

  while j <= n2 do
  begin
    arr[k] := R[j];
    Inc(j);
    Inc(k);
  end;
end;

procedure MergeSort(var arr: sArray; left, right: Integer; ascending: Boolean);
var
  middle: Integer;
begin
  if left < right then
  begin
    middle := (left + right) div 2;
    MergeSort(arr, left, middle, ascending);
    MergeSort(arr, middle + 1, right, ascending);
    Merge(arr, left, middle, right, ascending);
  end;
end;


exports FloatNumber;
exports QuickSort;
exports MergeSort;

begin
end.