import 'currency.dart';

class CurrencyService {
  static List<Currency> currencies = [
    Currency(code: 'USD', name: 'United States Dollar', exchangeRate: 1.0),
    Currency(code: 'EUR', name: 'Euro', exchangeRate: 0.85),
    Currency(code: 'GBP', name: 'British Pound Sterling', exchangeRate: 0.73),
    Currency(code: 'JPY', name: 'Japanese Yen', exchangeRate: 109.47),
    Currency(code: 'AUD', name: 'Australian Dollar', exchangeRate: 1.30),
    Currency(code: 'CAD', name: 'Canadian Dollar', exchangeRate: 1.25),
    Currency(code: 'CHF', name: 'Swiss Franc', exchangeRate: 0.92),
    Currency(code: 'CNY', name: 'Chinese Yuan', exchangeRate: 6.46),
    Currency(code: 'INR', name: 'Indian Rupee', exchangeRate: 74.79),
    Currency(code: 'IDR', name: 'Indonesian Rupiah', exchangeRate: 14425.0),
  ];
}
