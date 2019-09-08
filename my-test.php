<?

interface DoTestI {
    function go(): string;
}

function handler(DoTestI $test) {
    echo($test->go()  . "\n");
    echo ($test instanceof DoTestI ? "TRUE\n": "FALSE\n");
}

/*

(function() {
    echo "KOKO";
})->go();
 */


handler(function(): string {
    return "Test";
});
handler(function(): string {
    return "Test";
});
handler(function(): string {
    return "Test";
});
handler(function(): string {
    return "Test";
});
