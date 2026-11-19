// Gray Code Transition Detector - Mealy FSM (matches the Logisim circuit)
// States : IDLE (s=0), ACTIVE (s=1)
// V_COMB : 1 when exactly ONE bit differs between current X and previous P
// Outputs: Mealy - depend on state AND live inputs (ACK, X, P), no clock wait
module gray_code_mealy (
    input        clk,
    input        reset,     // synchronous, active-high
    input        start,
    input        ack,
    input  [3:0] x,         // current input
    output       valid,     // V = 1 : one-bit change
    output       invalid    // V = 0 : zero or >1 bit change
);
    reg       s;            // state: 0 = IDLE, 1 = ACTIVE
    reg [3:0] p;            // previous input register

    // ---------- one-bit-change detector (combinational) ----------
    wire [3:0] d = x ^ p;
    wire any_change = d[3] | d[2] | d[1] | d[0];
    wire two_or_more = (d[3] & d[2]) | (d[3] & d[1]) | (d[3] & d[0]) |
                       (d[2] & d[1]) | (d[2] & d[0]) | (d[1] & d[0]);
    wire v_comb = any_change & ~two_or_more;

    // ---------- next-state logic ----------
    // s_next = ~s & start  |  s & ~ack
    wire s_next = (~s & start) | (s & ~ack);

    // ---------- Mealy outputs (immediate) ----------
    assign valid   = s & ~ack &  v_comb;
    assign invalid = s & ~ack & ~v_comb;

    // ---------- registers ----------
    // P loads X whenever s_next = 1 (on START, then every clock while ACTIVE),
    // so P always holds the previous input.
    // If your P enable is wired to START instead, change "if (s_next)" to "if (start)".
    always @(posedge clk) begin
        if (reset) begin
            s <= 1'b0;
            p <= 4'b0000;
        end else begin
            s <= s_next;
            if (s_next) p <= x;
        end
    end
endmodule