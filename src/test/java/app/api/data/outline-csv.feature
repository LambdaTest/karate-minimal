Feature: using a csv file for data-driven testing

  Scenario Outline: dynamic ${__num + 1}
    # dynamic outline comment
    * print 'row:', __row
    * eval java.lang.Thread.sleep(30000)
    
    Examples:
      | read('data.csv') |
