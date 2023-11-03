class UserMailer < ApplicationMailer

  def loan_created_email(book_loan)
    @book_title = book_loan.book.title
    @due_date = book_loan.due_date

    mail(to: book_loan.user.email, subject: 'Your book loan was created')
  end

  def due_date_notification_email(book_loan)
    @book_title = book_loan.book.title
    @due_date = book_loan.due_date

    mail(to: book_loan.user.email, subject: 'Your book loan ends tomorrow')
  end
end
