
const A = [[2,1],[-1,1]]

const det = (matrix) => {
    const x1 = matrix[0][0]
    const x2 = matrix[0][1]
    const x3 = matrix[1][0]
    const x4 = matrix[1][1]

    const c = (x1 * x4) - (x2 * x3)
    const b = 0 - (x1 + x4)
    const a = 1

    console.log(a,b,c)

    const resultOne = (-b + Math.sqrt(b*b - 4*a*c)) / 2 * a
    const resultTwo = (-b - Math.sqrt(b*b - 4*a*c)) / 2 * a;
    return [resultOne, resultTwo];
}

const gcd = (a,b) => {
    const aAbs = Math.abs(a);
    const bAbs = Math.abs(b);
    if (!bAbs) {
        return aAbs;
    }
    return gcd(bAbs, aAbs % bAbs);
}

const eigenvector = (eigenvalues, matrix) => {
    const x1 = matrix[0][0]
    const x2 = matrix[0][1]
    const x3 = matrix[1][0]
    const x4 = matrix[1][1]

    const first = {
        one: x1,
        two: x2,
        value: eigenvalues
    }

    const second = {
        one: x3,
        two: x4,
        value: eigenvalues
    }

    first.one = first.one - first.value
    second.two = second.two - second.value
    console.log(second.two)

    const gcd_value = gcd(first.one, first.two);
    // console.log(gcd_value);

    const result = {
        firstPara: first.one,
        secondPara: first.two
    }

    return result;
}

const main = () => {
    const detValue = det(A);
    // console.log(detValue)

    const result01 = eigenvector(detValue[0], A);
    const result02 = eigenvector(detValue[1], A);

    // console.log(detValue[1]);
    console.log(result01);
    console.log(result02);
}

main()