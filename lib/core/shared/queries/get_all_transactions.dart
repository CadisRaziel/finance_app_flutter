//posso pegar essa query diretamente do grapqhl la no hasura
const String qGetAllTransactions = """
query GetAllTransactions {
  transaction {
    category
    created_at
    date
    description
    id
    status
    user_id
    value
  }
}
""";
