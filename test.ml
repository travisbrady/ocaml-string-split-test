open Printf

let std_split s = Str.split (Str.regexp " ") s

let splitrec s =
    let sl = String.length s in
    let rec loop last i acc =
        match (i = (sl)) with
        | true -> 
            let sx = String.create (i - last) in
            let _ = String.blit s last sx 0 (i - last) in
            List.rev (sx::acc)
        | false ->
            if ((String.get s i) = ' ') then
                let sx = String.create (i - last) in
                let _ = String.blit s last sx 0 (i - last) in
                flush stdout;
                loop (succ i) (succ i) (sx::acc)
            else 
                loop last (succ i) acc
    in
    loop 0 0 []

let run_test splitter s n =
    for i = 0 to n do
        let _ = splitter s in
        ()
    done

let my_index_from s from c = 
    try
        Some (String.index_from s from c)
    with Not_found ->
        None

let find_spaces s =
    let rec loop s last acc =
        match (my_index_from s last ' ') with
        | None -> List.rev acc
        | Some x -> 
            loop s (succ x) (x::acc)
    in
    loop s 0 []

let split_on_inds s inds =
    let sl = String.length s in
    let rec loop idx acc =
        match idx with
        | [] -> List.rev acc
        | [x] ->
            let sx = String.create (sl - x) in
            let () = String.blit s x sx 0 (sl - x) in
            loop [] (sx::acc)
        | (x::y::tail) -> 
            let sx = String.create (y - x) in
            let () = String.blit s x sx 0 (y - x) in
            loop (y::tail) (sx::acc)
    in
    loop (0::inds) []

let ind_split s = split_on_inds s (find_spaces s)

let _ = 
    let s = "blah 123 xxx 55 99 100 hi 111 222 333 444 555 aaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbb" in
    let n = 500000 in
    match Sys.argv.(1) with
    | "std" -> run_test std_split s n
    | "splitrec" -> run_test splitrec s n
    | "ind_split" -> run_test ind_split s n
    | _ -> eprintf "Please provide a valid split function name\n"




