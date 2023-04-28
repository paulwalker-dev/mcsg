8 rca(8 a, 8 b) {
    8 stage1 <- xor(a, b);
    8 stage1c <- and(a, b);
    8 stage2c <- and(stage1, shift);
    8 carry <- or(stage1c, stage2c);
    8 shift <- rsh(carry);
    8 final <- xor(stage1, shift);
}
