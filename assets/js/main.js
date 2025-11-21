const eventModal = new bootstrap.Modal(document.getElementById('eventModal'));
const unitModal = new bootstrap.Modal(document.getElementById('unitModal'));
const sectorModal = new bootstrap.Modal(document.getElementById('sectorModal'));
const adminUserModal = new bootstrap.Modal(document.getElementById('adminUserModal'));

// Global form oluşturucu
const deleteFormHtml = `
    <form method="post" id="deleteItemForm" style="display:none;">
        <input type="hidden" name="csrf_token" value="">
        <input type="hidden" name="table" id="delete_table_input">
        <input type="hidden" name="id" id="delete_id_input">
        <input type="hidden" name="delete_item" value="1">
    </form>
`;
document.body.insertAdjacentHTML('beforeend', deleteFormHtml);

function newEvent() {
    document.getElementById('eventForm').reset();
    document.getElementById('event_id').value = '';
    document.getElementById('modal_unit_id').value = document.body.dataset.currentUnitId || '';
    document.getElementById('event_date').value = new Date().toISOString().split('T')[0];
    document.getElementById('event_status').value = 'pending';
    document.getElementById('payment_status').value = 'unpaid';
    document.getElementById('btnDeleteEvent').style.display = 'none';
    eventModal.show();
}

function newEventForDay(date) {
    newEvent();
    document.getElementById('event_date').value = date;
}

function editEvent(evt) {
    if (!document.body.dataset.isAdmin) return;
    document.getElementById('event_id').value = evt.id;
    document.getElementById('modal_unit_id').value = evt.unit_id;
    document.getElementById('event_date').value = evt.event_date;
    document.getElementById('event_time').value = evt.event_time;
    document.getElementById('event_name').value = evt.event_name;
    document.getElementById('event_contact').value = evt.contact_info;
    document.getElementById('event_notes').value = evt.notes;
    document.getElementById('event_status').value = evt.status;
    document.getElementById('payment_status').value = evt.payment_status || '';
    document.getElementById('btnDeleteEvent').style.display = 'block';
    eventModal.show();
}

function deleteEvent() {
    if (confirm('Bu kaydı silmek istediğinizden emin misiniz?')) {
        document.getElementById('delete_id_input').value = document.getElementById('event_id').value;
        document.getElementById('delete_table_input').value = 'events';
        document.getElementById('deleteItemForm').submit();
    }
}

function newUnit() {
    document.getElementById('form_unit_id').value = '';
    document.getElementById('form_unit_name').value = '';
    document.getElementById('form_unit_color').value = '#3498db';
    document.getElementById('form_unit_active').checked = true;
    unitModal.show();
}

function editUnit(u) {
    document.getElementById('form_unit_id').value = u.id;
    document.getElementById('form_unit_name').value = u.unit_name;
    document.getElementById('form_unit_color').value = u.color;
    document.getElementById('form_unit_active').checked = (u.is_active == 1);
    unitModal.show();
}

// --- SEKTÖR MODAL İŞLEMLERİ ---

function newSector() {
    document.getElementById('sectorModalLabel').innerText = 'Yeni Sektör Ekle';
    document.getElementById('sector_key').value = 'new';
    document.getElementById('new_sector_key').value = '';
    document.getElementById('new_sector_key').readOnly = false;
    document.getElementById('sector_name').value = '';
    document.getElementById('unit_label').value = '';
    document.getElementById('event_label').value = '';
    document.getElementById('contact_label').value = '';
    document.getElementById('time_label').value = '';
    document.getElementById('icon').value = '';
    document.getElementById('sector_is_active').checked = true;
    sectorModal.show();
}

function editSector(s) {
    document.getElementById('sectorModalLabel').innerText = 'Sektör Düzenle: ' + s.sector_name;
    document.getElementById('sector_key').value = s.sector_key;
    document.getElementById('new_sector_key').value = s.sector_key;
    document.getElementById('new_sector_key').readOnly = true; // Anahtar değiştirilemez
    document.getElementById('sector_name').value = s.sector_name;
    document.getElementById('unit_label').value = s.unit_label;
    document.getElementById('event_label').value = s.event_label;
    document.getElementById('contact_label').value = s.contact_label;
    document.getElementById('time_label').value = s.time_label;
    document.getElementById('icon').value = s.icon;
    document.getElementById('sector_is_active').checked = (s.is_active == 1);
    sectorModal.show();
}

// --- YÖNETİCİ MODAL İŞLEMLERİ ---

function newAdminUser() {
    document.getElementById('adminUserModalLabel').innerText = 'Yeni Yönetici Ekle';
    document.getElementById('user_id').value = 0;
    document.getElementById('username').value = '';
    document.getElementById('full_name').value = '';
    document.getElementById('email').value = '';
    document.getElementById('password').value = '';
    document.getElementById('user_is_active').checked = true;
    adminUserModal.show();
}

function editAdminUser(u) {
    document.getElementById('adminUserModalLabel').innerText = 'Yönetici Düzenle: ' + u.username;
    document.getElementById('user_id').value = u.id;
    document.getElementById('username').value = u.username;
    document.getElementById('full_name').value = u.full_name;
    document.getElementById('email').value = u.email;
    document.getElementById('password').value = ''; // Şifreyi boş bırak
    document.getElementById('user_is_active').checked = (u.is_active == 1);
    adminUserModal.show();
}


// --- RAPORLAMA İŞLEMLERİ ---

function validateReportDates(form) {
    const start = new Date(form.start_date.value);
    const end = new Date(form.end_date.value);
    if (start > end) {
        alert("Başlangıç tarihi, bitiş tarihinden sonra olamaz!");
        return false;
    }

    // Hangi butonun tıklandığını tespit etme (formun kendisi değil, basılan buton)
    const submitButton = document.activeElement;
    const exportType = submitButton.getAttribute('name') === 'generate_report' ? submitButton.value : 'view';

    // Hidden input'u oluştur veya güncelle
    let hiddenInput = form.querySelector('input[name="generate_report_type"]');
    if (!hiddenInput) {
        hiddenInput = document.createElement('input');
        hiddenInput.type = 'hidden';
        hiddenInput.name = 'generate_report'; // POST işlemi bunu kullanır
        form.appendChild(hiddenInput);
    }
    hiddenInput.value = exportType;

    return true;
}

// Başlangıç ve bitiş tarihlerini bugünün ayı ile otomatik doldurur
document.addEventListener('DOMContentLoaded', function() {
    const csrfToken = document.querySelector('meta[name="csrf-token"]');
    if (csrfToken) {
        document.getElementById('deleteItemForm').querySelector('input[name="csrf_token"]').value = csrfToken.content;
    }
    const today = new Date();
    const firstDayOfMonth = new Date(today.getFullYear(), today.getMonth(), 1).toISOString().split('T')[0];
    const lastDayOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0).toISOString().split('T')[0];

    const startDateInput = document.getElementById('start_date_report');
    const endDateInput = document.getElementById('end_date_report');

    if (startDateInput && !startDateInput.value) {
        startDateInput.value = firstDayOfMonth;
    }
    if (endDateInput && !endDateInput.value) {
        endDateInput.value = lastDayOfMonth;
    }
});
