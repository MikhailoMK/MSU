import ipaddress
import socket

def ip_info(ip = None, mask = None):
    if ip is None and mask is None:
        hostname = socket.gethostname()    
        ip = socket.gethostbyname(hostname) + '/24'
    else:
        ip = ip + '/' + mask

    ip_interface = ipaddress.ip_interface(ip)
    network = ip_interface.network
    ip_address = ip_interface.ip

    print(f'IP-адрес: {ip_address}')
    print(f'Маска: {network.netmask}')
    print(f'Сеть: {network.network_address}')
    print(f'Без маски: {network.broadcast_address}')
    print(f'С маской: {network.network_address} - {network.broadcast_address}')

    if isinstance(ip_address, ipaddress.IPv4Address):
        if (ip_address >= ipaddress.IPv4Address('0.0.0.0')) and (ip_address <= ipaddress.IPv4Address('127.0.0.0')):
            print('Класс A')
        elif (ip_address >= ipaddress.IPv4Address('128.0.0.0')) and (ip_address <= ipaddress.IPv4Address('191.255.0.0')):
            print('Класс B')
        elif (ip_address >= ipaddress.IPv4Address('192.0.0.0')) and (ip_address <= ipaddress.IPv4Address('223.255.255.0')):
            print('Класс C')
        elif (ip_address >= ipaddress.IPv4Address('224.0.0.0')) and (ip_address <= ipaddress.IPv4Address('239.0.0.0')):
            print('Класс D')
        elif (ip_address >= ipaddress.IPv4Address('240.0.0.0')) and (ip_address <= ipaddress.IPv4Address('255.0.0.0')):
            print('Класс E')    
        else:
            print('Адрес виртуализации')
    else:
        print('Это IPv6 адрес')

def main():
    while True:
        choice = input('1 - системная информация, 2 - ручной ввод, 3 - выход: ')
        if choice == '1':
            print()
            ip_info()
            print()
        elif choice == '2':
            print()
            ip = input('Введите IP-адрес: ')
            mask = input('Введите маску подсети: ')
            ip_info(ip, mask)
            print()
        elif choice == '3':
            break
        else:
            print()
            print('Неверный выбор. Пожалуйста, введите 1, 2 или 3.')

if __name__ == '__main__':
    main()