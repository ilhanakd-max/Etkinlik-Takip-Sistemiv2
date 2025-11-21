<?php
// core/functions.php - Yardımcı Fonksiyonlar

/**
 * Girdiyi temizler ve güvenli hale getirir.
 * @param mixed $data Temizlenecek veri.
 * @return string Temizlenmiş ve güvenli hale getirilmiş dize.
 */
function clean_input($data): string {
    $sanitized = trim(strip_tags((string) $data));
    return preg_replace('/[\x00-\x1F\x7F]/u', '', $sanitized) ?? '';
}

/**
 * Mevcut oturumun yönetici olup olmadığını kontrol eder.
 * @return bool Yönetici ise true, değilse false.
 */
function is_admin(): bool {
    return isset($_SESSION['admin']) && $_SESSION['admin'] === true;
}

/**
 * Mevcut oturumun süper yönetici olup olmadığını kontrol eder.
 * @return bool Süper yönetici ise true, değilse false.
 */
function is_super_admin(): bool {
    if (isset($_SESSION['super_admin']) && $_SESSION['super_admin'] === true) {
        return true;
    }
    return isset($_SESSION['admin_user']['role']) && $_SESSION['admin_user']['role'] === 'super_admin';
}

/**
 * CSRF token oluşturur.
 * @return string Oluşturulan CSRF token.
 */
function generateCSRFToken(): string {
    if (!isset($_SESSION['csrf_token'])) {
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf_token'];
}

/**
 * Verilen CSRF token'ının geçerli olup olmadığını kontrol eder.
 * @param string $token Kontrol edilecek token.
 * @return bool Token geçerliyse true, değilse false.
 */
function validateCSRFToken(string $token): bool {
    return isset($_SESSION['csrf_token']) && hash_equals($_SESSION['csrf_token'], $token);
}

/**
 * Verilen tarihin geçerli bir 'Y-m-d' formatında olup olmadığını kontrol eder.
 * @param mixed $date Kontrol edilecek tarih.
 * @return bool Tarih geçerliyse true, değilse false.
 */
function is_valid_date_string($date): bool {
    if (!is_string($date) || $date === '') {
        return false;
    }
    $d = DateTime::createFromFormat('Y-m-d', $date);
    return $d && $d->format('Y-m-d') === $date;
}

/**
 * Türkçe tarih formatı oluşturur.
 * @param string $format Tarih formatı.
 * @param int|null $timestamp Zaman damgası.
 * @return string Türkçeleştirilmiş tarih dizesi.
 */
function turkish_date(string $format, int $timestamp = null): string {
    $turkish_months = [
        1 => 'Ocak', 2 => 'Şubat', 3 => 'Mart', 4 => 'Nisan', 5 => 'Mayıs', 6 => 'Haziran',
        7 => 'Temmuz', 8 => 'Ağustos', 9 => 'Eylül', 10 => 'Ekim', 11 => 'Kasım', 12 => 'Aralık'
    ];
    $turkish_days = [
        'Monday' => 'Pazartesi', 'Tuesday' => 'Salı', 'Wednesday' => 'Çarşamba',
        'Thursday' => 'Perşembe', 'Friday' => 'Cuma', 'Saturday' => 'Cumartesi', 'Sunday' => 'Pazar'
    ];

    $timestamp = $timestamp ?? time();
    $date_str = date($format, $timestamp);

    // Ay ve gün isimlerini Türkçeye çevir
    $date_str = str_replace(date('F', $timestamp), $turkish_months[date('n', $timestamp)], $date_str);
    $date_str = str_replace(date('l', $timestamp), $turkish_days[date('l', $timestamp)], $date_str);

    return $date_str;
}
