// public/cpresources/dwiki-form.js
console.log("✅ dwiki-form2.js betöltve");
document.addEventListener("DOMContentLoaded", function() {
    const fieldsBody = document.getElementById('fieldsBody');
    const modal = document.getElementById('fieldModal');
    const addBtn = document.getElementById('addFieldBtn');
    const cancelBtn = document.getElementById('cancelFieldBtn');
    const saveBtn = document.getElementById('saveFieldBtn');
    const fieldLabel = document.getElementById('fieldLabel');
    const fieldType = document.getElementById('fieldType');
    const fieldWidth = document.getElementById('fieldWidth');
    const fieldRequired = document.getElementById('fieldRequired');
    const optionsWrapper = document.getElementById('optionsWrapper');
    const optionsList = document.getElementById('optionsList');
    const addOptionBtn = document.getElementById('addOptionBtn');
    const placeholderSwitch = document.getElementById('globalPlaceholderSwitch');

    // Új: határozzuk meg az aktuális űrlap kulcsot (formKey) az admin nézetben.
    const formKeyInput = document.getElementById('formKeyInput');
    const currentFormKey = formKeyInput ? (formKeyInput.value.trim() || 'default') : 'default';

    let editId = null;

    addBtn.addEventListener('click', () => {
        editId = null;
        fieldLabel.value = '';
        fieldType.value = 'text';
        fieldWidth.value = 'w-full';
        fieldRequired.checked = false;
        optionsWrapper.style.display = 'none';
        optionsList.innerHTML = '';
        modal.style.display = 'flex';
    });

    cancelBtn.addEventListener('click', () => modal.style.display = 'none');

    fieldType.addEventListener('change', () => {
        optionsList.innerHTML = '';
        addOptionBtn.style.display = 'none';
        if (fieldType.value === 'select') {
            optionsWrapper.style.display = 'block';
            addOptionBtn.style.display = 'inline-block';
            optionsWrapper.querySelector('label').textContent = 'Opciók:';
        } else if (fieldType.value === 'static') {
            optionsWrapper.style.display = 'block';
            optionsWrapper.querySelector('label').textContent = 'Szöveg:';
            const textarea = document.createElement('textarea');
            textarea.style.minHeight = '80px';
            textarea.value = '';
            optionsList.appendChild(textarea);
        } else {
            optionsWrapper.style.display = 'none';
        }
    });

    addOptionBtn.addEventListener('click', () => {
        if (fieldType.value === 'select') {
            const input = document.createElement('input');
            input.type = 'text';
            input.placeholder = 'Opció';
            optionsList.appendChild(input);
        }
    });

    placeholderSwitch?.addEventListener('change', () => {
        const enabled = placeholderSwitch.checked;
        Craft.sendActionRequest('POST', 'dwiki-form2/default/save-placeholder-mode', { data: { enabled } })
            .then(res => res.data.success ? Craft.cp.displayNotice('Placeholder mód frissítve.') : Craft.cp.displayError('Hiba a mentésnél.'))
            .catch(() => Craft.cp.displayError('Hiba a mentésnél.'));
    });

    saveBtn.addEventListener('click', () => {
        const label = fieldLabel.value.trim();
        const type = fieldType.value;
        const width = fieldWidth.value;
        const required = fieldRequired.checked ? 1 : 0;
        let options = '';

        if (type === 'select') {
            options = Array.from(optionsList.querySelectorAll('input'))
                .map(i => i.value.trim())
                .filter(v => v)
                .join("\n");
        } else if (type === 'static') {
            const textarea = optionsList.querySelector('textarea');
            options = textarea ? textarea.value : '';
        }

        if (!label) {
            alert('A mező neve kötelező');
            return;
        }

        Craft.sendActionRequest('POST', 'dwiki-form2/default/save', {
            data: { id: editId, label, type, width, options, required, formKey: currentFormKey }
        }).then(res => {
            if (res.data.success) {
                renderTable(res.data.fields);
                modal.style.display = 'none';
                Craft.cp.displayNotice('Mező mentve.');
            } else {
                Craft.cp.displayError('Hiba a mentésnél.');
            }
        }).catch(() => Craft.cp.displayError('Hiba a mentésnél.'));
    });

    fieldsBody.addEventListener('click', function(e) {
        const row = e.target.closest('tr');
        const id = row ? row.getAttribute('data-id') : null;

        if (e.target.classList.contains('deleteBtn')) {
            if (!confirm('Biztosan törlöd?')) return;
            Craft.sendActionRequest('POST', 'dwiki-form2/default/delete', { data: { id, formKey: currentFormKey } })
                .then(res => {
                    if (res.data.success) {
                        renderTable(res.data.fields);
                        Craft.cp.displayNotice('Mező törölve.');
                    } else {
                        Craft.cp.displayError('Hiba a törlésnél.');
                    }
                }).catch(() => Craft.cp.displayError('Hiba a törlésnél.'));
        }

        if (e.target.classList.contains('editBtn')) {
            Craft.sendActionRequest('POST', 'dwiki-form2/default/get', { data: { id, formKey: currentFormKey } })
                .then(res => {
                    if (res.data.success && res.data.field) {
                        const f = res.data.field;
                        editId = f.id;
                        fieldLabel.value = f.label;
                        fieldType.value = f.type;
                        fieldWidth.value = f.width || 'w-full';
                        fieldRequired.checked = !!f.required;

                        optionsList.innerHTML = '';
                        addOptionBtn.style.display = 'none';

                        if (f.type === 'select') {
                            optionsWrapper.style.display = 'block';
                            addOptionBtn.style.display = 'inline-block';
                            optionsWrapper.querySelector('label').textContent = 'Opciók:';
                            let opts = [];
                            if (Array.isArray(f.options)) {
                                opts = f.options;
                            } else if (typeof f.options === 'string') {
                                try {
                                    const parsed = JSON.parse(f.options);
                                    opts = Array.isArray(parsed) ? parsed : f.options.split("\n").map(o => o.trim()).filter(o => o);
                                } catch(e) {
                                    opts = f.options.split("\n").map(o => o.trim()).filter(o => o);
                                }
                            }
                            if (opts.length === 0) opts = [''];
                            opts.forEach(opt => {
                                const input = document.createElement('input');
                                input.type = 'text';
                                input.value = opt;
                                optionsList.appendChild(input);
                            });
                        } else if (f.type === 'static') {
                            optionsWrapper.style.display = 'block';
                            optionsWrapper.querySelector('label').textContent = 'Szöveg:';
                            const textarea = document.createElement('textarea');
                            textarea.style.minHeight = '80px';
                            textarea.value = (typeof f.options === 'string') ? f.options : '';
                            optionsList.appendChild(textarea);
                        } else {
                            optionsWrapper.style.display = 'none';
                        }

                        modal.style.display = 'flex';
                    } else {
                        Craft.cp.displayError('Hiba a mező betöltésekor.');
                    }
                }).catch(() => Craft.cp.displayError('Hiba a mező betöltésekor.'));
        }
    });

    let draggedRow = null;
    fieldsBody.addEventListener('dragstart', function(e) {
        draggedRow = e.target.closest('tr');
        e.dataTransfer.effectAllowed = 'move';
    });
    fieldsBody.addEventListener('dragover', function(e) {
        e.preventDefault();
        const targetRow = e.target.closest('tr');
        if (targetRow && targetRow !== draggedRow) {
            const rect = targetRow.getBoundingClientRect();
            const next = (e.clientY - rect.top) / (rect.bottom - rect.top) > 0.5;
            fieldsBody.insertBefore(draggedRow, next ? targetRow.nextSibling : targetRow);
        }
    });
    fieldsBody.addEventListener('drop', function() {
        const order = Array.from(fieldsBody.querySelectorAll('tr')).map(tr => tr.getAttribute('data-id'));
        Craft.sendActionRequest('POST', 'dwiki-form2/default/update-order', { data: { order, formKey: currentFormKey } })
            .then(res => res.data.success ? Craft.cp.displayNotice('Sorrend frissítve.') : Craft.cp.displayError('Hiba a sorrend mentésénél.'))
            .catch(() => Craft.cp.displayError('Hiba a sorrend mentésénél.'));
    });

    function renderTable(fields) {
        fieldsBody.innerHTML = '';
        if (!fields.length) {
            fieldsBody.innerHTML = '<tr><td colspan="6"><em>Nincs még mező.</em></td></tr>';
            return;
        }
        fields.forEach(f => {
            let optionsStr = '';
            if (Array.isArray(f.options)) {
                optionsStr = f.options.join(', ');
            } else if (typeof f.options === 'string') {
                optionsStr = f.options;
            }
            fieldsBody.innerHTML += `
                <tr data-id="${f.id}" draggable="true">
                    <td>${f.label}</td>
                    <td>${f.type}</td>
                    <td>${optionsStr}</td>
                    <td>${f.width || ''}</td>
                    <td>${f.required ? '✔️' : ''}</td>
                    <td>
                        <span class="moveIcon" style="cursor:grab;">☰</span>
                        <button class="btn small editBtn">Szerkesztés</button>
                        <button class="btn small deleteBtn">Törlés</button>
                    </td>
                </tr>
            `;
        });
    }
});
