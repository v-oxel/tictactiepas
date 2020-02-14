program tictactoe;

uses
  crt;

var
  f// field array
  : array[1..9] of char;
  
  n,  // service field variable
  k,  // number of moves
  x,  // X position
  o// O position
  : byte;
  
  win_x,     // win X
  win_o,     // win O
  draw,      // friendship win(chainsaw)
  move,      // if false then X move else O move
  e,         // error
  no,        // exit check
  bot_usage  // bot usage check
  : boolean;

// field drawing
procedure field();
var
  i: byte;
begin
  for i := 1 to 3 do
  begin
    writeln(' ', f[i + n], ' | ', f[i + n + 1], ' | ', f[i + n + 2]);
    if i = 3 then
      break;
    writeln('---+---+---');
    n := n + 2;
  end;
end;

//start of game
procedure start();
var
  i: byte;
begin
  clrscr;  
  n := 0;    
  k := 1;
  f[1] := '1';
  f[2] := '2';
  f[3] := '3';
  f[4] := '4';
  f[5] := '5';
  f[6] := '6';
  f[7] := '7';
  f[8] := '8';
  f[9] := '9'; 
  field();
  readln;
  clrscr;
  for i := 1 to 9 do
    f[i] := ' ';
  
end;

// bot does not allow to win X
procedure ai_check_x();

begin
  if (f[1] = 'X') and (f[2] = 'X') and (f[3] = ' ') then
  begin
    f[3] := 'O';
    move := false; 
  end	
  else if (f[1] = 'X') and (f[3] = 'X') and (f[2] = ' ')  then
  begin
    f[2] := 'O';
    move := false; 
  end	
  else if (f[2] = 'X') and (f[3] = 'X') and (f[1] = ' ') then
  begin
    f[1] := 'O';
    move := false; 
  end
  else if (f[4] = 'X') and (f[5] = 'X') and (f[6] = ' ') then
  begin
    f[6] := 'O';
    move := false; 
  end
  else if (f[4] = 'X') and (f[6] = 'X') and (f[5] = ' ') then
  begin
    f[5] := 'O';
    move := false; 
  end
  else if (f[5] = 'X') and (f[6] = 'X') and (f[4] = ' ') then
  begin
    f[4] := 'O';
    move := false; 
  end
  else if (f[7] = 'X') and (f[8] = 'X') and (f[9] = ' ') then
  begin
    f[9] := 'O';
    move := false; 
  end
  else if (f[7] = 'X') and (f[9] = 'X') and (f[8] = ' ') then
  begin
    f[8] := 'O';
    move := false; 
  end
  else if (f[8] = 'X') and (f[9] = 'X') and (f[7] = ' ') then
  begin
    f[7] := 'O';
    move := false; 
  end
  else if (f[1] = 'X') and (f[4] = 'X') and (f[7] = ' ') then
  begin
    f[7] := 'O';
    move := false; 
  end
  else if (f[1] = 'X') and (f[7] = 'X') and (f[4] = ' ') then
  begin
    f[4] := 'O';
    move := false; 
  end
  else if (f[4] = 'X') and (f[7] = 'X') and (f[1] = ' ') then
  begin
    f[1] := 'O';
    move := false; 
  end
  else if (f[1] = 'X') and (f[4] = 'X') and (f[7] = ' ') then
  begin
    f[7] := 'O';
    move := false; 
  end
  else if (f[2] = 'X') and (f[5] = 'X') and (f[8] = ' ') then
  begin
    f[8] := 'O';
    move := false; 
  end
  else if (f[2] = 'X') and (f[8] = 'X') and (f[5] = ' ') then
  begin
    f[5] := 'O';
    move := false; 
  end
  else if (f[5] = 'X') and (f[8] = 'X') and (f[2] = ' ') then
  begin
    f[2] := 'O';
    move := false; 
  end
  else if (f[3] = 'X') and (f[6] = 'X') and (f[9] = ' ') then
  begin
    f[9] := 'O';
    move := false; 
  end
  else if (f[3] = 'X') and (f[9] = 'X') and (f[6] = ' ') then
  begin
    f[6] := 'O';
    move := false; 
  end
  else if (f[6] = 'X') and (f[9] = 'X') and (f[3] = ' ') then
  begin
    f[3] := 'O';
    move := false; 
  end
  else if (f[1] = 'X') and (f[5] = 'X') and (f[9] = ' ') then
  begin
    f[9] := 'O';
    move := false; 
  end
  else if (f[1] = 'X') and (f[9] = 'X') and (f[5] = ' ') then
  begin
    f[5] := 'O';
    move := false; 
  end
  else if (f[5] = 'X') and (f[9] = 'X') and (f[1] = ' ') then
  begin
    f[1] := 'O';
    move := false; 
  end
  else if (f[3] = 'X') and (f[5] = 'X') and (f[7] = ' ') then
  begin
    f[7] := 'O';
    move := false; 
  end
  else if (f[3] = 'X') and (f[7] = 'X') and (f[5] = ' ') then
  begin
    f[5] := 'O';
    move := false; 
  end
  else if (f[5] = 'X') and (f[7] = 'X') and (f[3] = ' ') then
  begin
    f[3] := 'O';
    move := false; 
  end;
end;

// bot finishes a row to win
procedure ai_check_o();

begin
  if (f[1] = 'O') and (f[2] = 'O') and (f[3] = ' ') then
  begin
    f[3] := 'O';
    move := false; 
  end	
  else if (f[1] = 'O') and (f[3] = 'O') and (f[2] = ' ')  then
  begin
    f[2] := 'O';
    move := false; 
  end	
  else if (f[2] = 'O') and (f[3] = 'O') and (f[1] = ' ') then
  begin
    f[1] := 'O';
    move := false; 
  end
  else if (f[4] = 'O') and (f[5] = 'O') and (f[6] = ' ') then
  begin
    f[6] := 'O';
    move := false; 
  end
  else if (f[4] = 'O') and (f[6] = 'O') and (f[5] = ' ') then
  begin
    f[5] := 'O';
    move := false; 
  end
  else if (f[5] = 'O') and (f[6] = 'O') and (f[4] = ' ') then
  begin
    f[4] := 'O';
    move := false; 
  end
  else if (f[7] = 'O') and (f[8] = 'O') and (f[9] = ' ') then
  begin
    f[9] := 'O';
    move := false; 
  end
  else if (f[7] = 'O') and (f[9] = 'O') and (f[8] = ' ') then
  begin
    f[8] := 'O';
    move := false; 
  end
  else if (f[8] = 'O') and (f[9] = 'O') and (f[7] = ' ') then
  begin
    f[7] := 'O';
    move := false; 
  end
  else if (f[1] = 'O') and (f[4] = 'O') and (f[7] = ' ') then
  begin
    f[7] := 'O';
    move := false; 
  end
  else if (f[1] = 'O') and (f[7] = 'O') and (f[4] = ' ') then
  begin
    f[4] := 'O';
    move := false; 
  end
  else if (f[4] = 'O') and (f[7] = 'O') and (f[1] = ' ') then
  begin
    f[1] := 'O';
    move := false; 
  end
  else if (f[1] = 'O') and (f[4] = 'O') and (f[7] = ' ') then
  begin
    f[7] := 'O';
    move := false; 
  end
  else if (f[2] = 'O') and (f[5] = 'O') and (f[8] = ' ') then
  begin
    f[8] := 'O';
    move := false; 
  end
  else if (f[2] = 'O') and (f[8] = 'O') and (f[5] = ' ') then
  begin
    f[5] := 'O';
    move := false; 
  end
  else if (f[5] = 'O') and (f[8] = 'O') and (f[2] = ' ') then
  begin
    f[2] := 'O';
    move := false; 
  end
  else if (f[3] = 'O') and (f[6] = 'O') and (f[9] = ' ') then
  begin
    f[9] := 'O';
    move := false; 
  end
  else if (f[3] = 'O') and (f[9] = 'O') and (f[6] = ' ') then
  begin
    f[6] := 'O';
    move := false; 
  end
  else if (f[6] = 'O') and (f[9] = 'O') and (f[3] = ' ') then
  begin
    f[3] := 'O';
    move := false; 
  end
  else if (f[1] = 'O') and (f[5] = 'O') and (f[9] = ' ') then
  begin
    f[9] := 'O';
    move := false; 
  end
  else if (f[1] = 'O') and (f[9] = 'O') and (f[5] = ' ') then
  begin
    f[5] := 'O';
    move := false; 
  end
  else if (f[5] = 'O') and (f[9] = 'O') and (f[1] = ' ') then
  begin
    f[1] := 'O';
    move := false; 
  end
  else if (f[3] = 'O') and (f[5] = 'O') and (f[7] = ' ') then
  begin
    f[7] := 'O';
    move := false; 
  end
  else if (f[3] = 'O') and (f[7] = 'O') and (f[5] = ' ') then
  begin
    f[5] := 'O';
    move := false; 
  end
  else if (f[5] = 'O') and (f[7] = 'O') and (f[3] = ' ') then
  begin
    f[3] := 'O';
    move := false; 
  end;
end;

// if bot can't check the victory of X or his he makes a random move
procedure ai_check_neutral();

begin
  if (f[5] = ' ') then
  begin
    f[5] := 'O';
    move := false;
  end
  else if f[1] = ' ' then
  begin
    f[1] := 'O';
    move := false;
  end
  else if f[3] = ' ' then
  begin
    f[1] := 'O';
    move := false;
  end
  else if f[7] = ' ' then
  begin
    f[7] := 'O';
    move := false;
  end
  else if f[9] = ' ' then
  begin
    f[9] := 'O';
    move := false;
  end
  else
  begin
    while true do
    begin
      o := random(1, 10);
      if f[o] = ' ' then
      begin
        f[o] := 'O';
        move := false;
        exit;
      end;
    end;
  end;
end;

// all ai at one place
procedure ai_used();

begin
  ai_check_x();
  if move = false then
    exit;
  ai_check_o();
  if move = false then
    exit;
  ai_check_neutral();
end;

// procedure of moving
procedure moving();

begin
  field;
  if move = false then
  begin
    writeln('X"s move');
    move := true;
    readln(x);
    if (x > 9) or (f[x] <> ' ') then
    begin
      e := true;
      exit;
    end;
    f[x] := 'X';
  end
  else if bot_usage = false then
  begin
    writeln('O"s move');
    move := false;
    readln(o);
    if (o > 9) or (f[o] <> ' ') then
    begin
      e := true;
      exit;
    end;
    f[o] := 'O';
  end
  else if (bot_usage = true) and (move = true) then
    ai_used();
end;

// check for win or draw
procedure check();

begin
  if (k >= 10) and (win_x = false) and (win_o = false) then
    draw := true;
  if ((f[1] = 'X') and (f[2] = 'X') and (f[3] = 'X')) or
         ((f[4] = 'X') and (f[5] = 'X') and (f[6] = 'X')) or
         ((f[7] = 'X') and (f[8] = 'X') and (f[9] = 'X')) or
         ((f[1] = 'X') and (f[4] = 'X') and (f[7] = 'X')) or
         ((f[2] = 'X') and (f[5] = 'X') and (f[8] = 'X')) or
         ((f[3] = 'X') and (f[6] = 'X') and (f[9] = 'X')) or
         ((f[1] = 'X') and (f[5] = 'X') and (f[9] = 'X')) or
         ((f[3] = 'X') and (f[5] = 'X') and (f[7] = 'X')) then
    win_x := true;
  if ((f[1] = 'O') and (f[2] = 'O') and (f[3] = 'O')) or
         ((f[4] = 'O') and (f[5] = 'O') and (f[6] = 'O')) or
         ((f[7] = 'O') and (f[8] = 'O') and (f[9] = 'O')) or
         ((f[1] = 'O') and (f[4] = 'O') and (f[7] = 'O')) or
         ((f[2] = 'O') and (f[5] = 'O') and (f[8] = 'O')) or
         ((f[3] = 'O') and (f[6] = 'O') and (f[9] = 'O')) or
         ((f[1] = 'O') and (f[5] = 'O') and (f[9] = 'O')) or
         ((f[3] = 'O') and (f[5] = 'O') and (f[7] = 'O')) then
    win_o := true;
end;

// zeroing
procedure zero();
var
  i: byte;
begin
  win_x := false;
  win_o := false;
  draw := false;
  move := false;
  n := 0;
  k := 1;
  for i := 1 to 9 do
    f[i] := ' ';
  clrscr;
end;

// end of game
procedure finish();

begin
  field();
  if win_x = true then
    writeln('X WIN!')
  else if win_o = true then
    writeln('O WIN!')
  else if draw = true then
    writeln('DRAW!')
      else 
  begin
    writeln('err #2 idk');
    e := true;
    exit;
  end;
  writeln('AGAIN?(Y/N)');
  write('>> ');
  read(f[1]);
  if (f[1] = 'N') or (f[1] = 'n') or (f[1] = 'Н') or (f[1] = 'н') then
  begin
    no := true;
    exit;
  end
  else if (f[1] = 'Y') or (f[1] = 'y') or (f[1] = 'Д') or (f[1] = 'д') then
  begin
    zero();
  end
      else
  begin
    writeln('err #3 wrong symbol y/n');
    e := true;
    exit;
  end; 
end;

// check bot usage
procedure bot_use();

begin
  writeln('Use bot?(Y/N)');
  write('>> ');
  read(f[1]);
  if (f[1] = 'N') or (f[1] = 'n') or (f[1] = 'Н') or (f[1] = 'н') then
  begin
    bot_usage := false;
  end
  else if (f[1] = 'Y') or (f[1] = 'y') or (f[1] = 'Д') or (f[1] = 'д') then
  begin
    bot_usage := true;
  end
  else
  begin
    writeln('err #3 wrong symbol y/n');
    e := true;
    exit;
  end; 
end;


// main part
begin
  clrscr;
  writeln('TicTacToe');
  bot_use();
  if e = true then
    exit;
  readln;
  start();
  while true do
  begin
    while (win_x = false) and (win_o = false) and (draw = false) do
    begin
      n := 0;
      moving();
      if e = true then
      begin
        writeln('err #1 wrong number move');
        exit;
      end;
      clrscr; 
      k := k + 1;
      check();
    end;
    n := 0;
    finish();
    if no = true then
      exit;
    if e = true then
    begin
      writeln('err #3 wrong symbol y/n');
      exit;
    end;
  end;
end.