import Foundation

public extension String {
    /// Determines if a character at a given index is a member of the provided character set.
    func character(atIndex index: Int, isInCharacterSet characterSet: CharacterSet) -> Bool {
        guard index >= 0 && index < self.count else {
            return false
        }
        
        let characterIndex = self.utf16.index(self.utf16.startIndex, offsetBy: index)
        let c = self.utf16[characterIndex]
        return characterSet.contains(UnicodeScalar(c)!)
    }
    
    var spaceSeparatedWords: String {
        let characterSet = CharacterSet.uppercaseLetters
        
        var result = self
        
        for (index, character) in result.enumerated().reversed() {
            guard index > 0 else {
                continue
            }
            
            let thisCharacter = result.character(atIndex: index, isInCharacterSet: characterSet)
            let precedingCharacter = result.character(atIndex: index.advanced(by: -1), isInCharacterSet: characterSet)
            
            if thisCharacter && !precedingCharacter {
                let range = result.index(result.startIndex, offsetBy: index)...result.index(result.startIndex, offsetBy: index)
                result.replaceSubrange(range, with: " \(character)")
            }
        }
        
        return result
    }
}
