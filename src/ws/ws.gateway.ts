import { Logger } from '@nestjs/common'
import { OnEvent } from '@nestjs/event-emitter'
import { WebSocketGateway, WebSocketServer } from '@nestjs/websockets'
import { Server } from 'ws'

@WebSocketGateway()
export class WsGateway {
  private readonly logger = new Logger(WsGateway.name)

  @WebSocketServer()
  server: Server

  @OnEvent('update')
  onUpdate(entity: string, id: string) {
    this.logger.debug('update', `${entity}#${id}`)
    this.server.clients.forEach((client) => client.send(`update.${entity}#${id}`))
  }
}
