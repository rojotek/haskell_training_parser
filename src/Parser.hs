module Parser where 
type ErrorMessage =
  String

data Validation a =
  Error ErrorMessage
  | Value a
  deriving (Eq, Show)

type Input =
  String

newtype Parser a = Parser {
  parse :: Input -> Validation (Input, a)
}

newtype ParserT m a = ParserT {
  parseT :: Input -> m (Validation (Input, a))
}

