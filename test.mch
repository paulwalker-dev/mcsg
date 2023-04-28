8 rca(a, b) {
    stage1 <- xor(a, b);
    stage1c <- and(a, b);
    stage2c <- and(stage1, shift);
    carry <- or(stage1c, stage2c);
    shift <- rsh(carry);
    final <- xor(stage1, shift);
}
