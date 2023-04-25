// Import
import Foundation

// This is the main function.
func main() {
    do {
        // Read the input file.
        let input = try String(contentsOfFile: "input.txt", encoding: .utf8)
        let inputLines = input.split(separator: "\n")

        // Create the output file.
        let output = FileHandle(forWritingAtPath: "output.txt")
        output?.truncateFile(atOffset: 0)

        // This loops each line of the file to the function.
        for inputLine in inputLines {
            if let num = Int(inputLine) {
                // Function call
                let factorial = recFactorial(num: num)

                // Print to the file
                let outputData = "\(factorial)\n".data(using: .utf8)
                output?.write(outputData!)
            }
        }

        // Close the writer
        output?.closeFile()

    } catch {
        print("Error: \(error.localizedDescription)")
    }
}

// This function calculates the factorial of a number
func recFactorial(num: Int) -> Int {
    // Base case
    if num <= 1 {
        return 1
    } else {
        // Call the function recursively.
        return recFactorial(num: num - 1) * num
    }
}

main()
