public struct Brainfxck{
    let code:String
    public init(code: String){
        self.code = code
    }
    public func eval(input:String) -> String{
        var ary = Array(repeating:0, count:10000)
        var idx = ary.startIndex
        var jumpTable:[String.CharacterView.Index] = []
        var PC = code.characters.startIndex
        var inputIdx = input.startIndex
        var output = ""
        while PC != code.characters.endIndex {
            let ch = code.characters[PC]
            switch ch {
            case ">":
                PC = code.characters.index(after: PC)
                idx = ary.index(after: idx)
            case "<":
                PC = code.characters.index(after: PC)
                guard idx != ary.startIndex else {
                    continue
                }
                idx = ary.index(before: idx)
            case "+":
                PC = code.characters.index(after: PC)
                ary[idx] = ary[idx] == 255 ? 0 : ary[idx] + 1
            case "-":
                PC = code.characters.index(after: PC)
                ary[idx] = ary[idx] == 0 ? 255 : ary[idx] - 1
            case ",":
                PC = code.characters.index(after: PC)
                let inputCH = inputIdx == input.endIndex ? "\0" : String(input[inputIdx])
                let c:Int = Int(inputCH.unicodeScalars.first!.value)
                ary[idx] = c > 255 ? 0 : c
                if inputIdx != input.endIndex {
                    inputIdx = input.index(after: inputIdx)
                }
            case ".":
                PC = code.characters.index(after: PC)
                let scalar = UnicodeScalar(ary[idx])
                var scalarView = String.UnicodeScalarView()
                scalarView.append(scalar!)
                output.append(String(scalarView))
            case "[":
                PC = code.characters.index(after: PC)
                jumpTable.append(PC)
            case "]":
                if ary[idx] == 0 {
                    _ = jumpTable.dropLast(1)
                    PC = code.characters.index(after: PC)
                } else {
                    PC = jumpTable.last!
                }
            default:
                PC = code.characters.index(after: PC)
                continue
            }
        }
        return output
    }
}
