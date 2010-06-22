let run_test s n =
    for i = 0 to n do
        let _ = BatString.nsplit s " " in
        ()
    done

let _ = 
    let s = "blah 123 xxx 55 99 100 hi 111 222 333 444 555 aaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbb" in
    let n = 500000 in
    run_test s n
