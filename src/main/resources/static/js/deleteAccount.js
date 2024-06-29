// For Delete The USer Account

function deleteUserAccount() {
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this account data!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            // Show loading alert
            Swal.fire({
                title: 'Deleting...',
                text: 'Please wait while we delete your Account.',
                icon: 'info',
                allowOutsideClick: false,
                didOpen: () => {
                    Swal.showLoading();
                }
            });

            // Send delete request to the backend
            fetch(`${baseUrl}api/delete-account`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify()

            })
                .then(response => {

                    if (response.ok) {
                        // Show success alert

                        Swal.fire({
                            title: 'Deleted!',
                            text: 'The Account has been deleted.',
                            icon: 'success',
                            html: '<i class="fas fa-trash" style="color: red; font-size: 2em;"></i>',
                        });

                        window.location.replace(`${baseUrl}scm2/home`);

                    } else {
                        // Show error alert
                        Swal.fire({
                            title: 'Error!',
                            text: 'There was an error deleting the Account.',
                            icon: 'error',
                            allowOutsideClick: false
                        });
                    }
                })
                .catch(error => {
                    // Show error alert
                    Swal.fire({
                        title: 'Error!',
                        text: 'There was an error deleting the Account.',
                        icon: 'error',
                        allowOutsideClick: false
                    });
                });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            Swal.fire({
                title: 'Cancelled',
                text: 'Your Account is safe :)',
                icon: 'error',
                allowOutsideClick: false
            });
        }
    });

}
