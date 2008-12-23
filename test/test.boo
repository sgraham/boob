macro performTransaction:
    args = performTransaction.Arguments
    return [|
        block:
            _transaction = $(args[0]).BeginTransaction()
            try:
                $(performTransaction.Block)
                _transaction.Commit()
            except:
                _transaction.Rollback()
                raise "oh, no!"
            ensure:
                _transaction.Connection.Close()
    |].Block 

