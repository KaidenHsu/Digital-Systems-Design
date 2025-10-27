def decimal_to_bcd(decimal_number):
    decimal_str = str(decimal_number)
    bcd_parts = []

    for idx, digit_char in enumerate(decimal_str):
        digit = int(digit_char)

        if idx == 0:
            bcd_parts.append(bin(digit)[2:])
        else:
            bcd_parts.append(bin(digit)[2:].zfill(4))

    return "".join(bcd_parts)


from pathlib import Path


def test_cases_gen():
    # Use the repository layout: src/ is sibling to test_cases/, so
    # ../test_cases from this file's directory is the target folder.
    base_dir = Path(__file__).parent.parent / "test_cases"
    base_dir.mkdir(parents=True, exist_ok=True)

    a_path = base_dir / "a.txt"
    b_path = base_dir / "b.txt"
    c_path = base_dir / "c.txt"

    # Open the files inside ../test_cases and write BCD strings there.
    with a_path.open("w", encoding="utf-8") as fa, \
         b_path.open("w", encoding="utf-8") as fb, \
         c_path.open("w", encoding="utf-8") as fc:

        for i in range(100):
            for j in range(100):
                i_bcd = decimal_to_bcd(i)
                fa.write(i_bcd + "\n")

                j_bcd = decimal_to_bcd(j)
                fb.write(j_bcd + "\n")

                golden_bcd = decimal_to_bcd(i + j)
                fc.write(golden_bcd + "\n")


if __name__ == "__main__":
    test_cases_gen()
